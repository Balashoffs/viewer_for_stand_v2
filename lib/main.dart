import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/control_card_cubit/control_card_cubit.dart';
import 'package:viewer_for_stand_v2/cubit/save_host_value/save_host_value_cubit.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';
import 'package:viewer_for_stand_v2/repository/controls_state_repository.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/repository/card_control_repository.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/ifc_viewer_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';
import 'package:viewer_for_stand_v2/widget/text_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initWebServer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viewer with BMS',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainPage(title: 'Viewer with BMS'),
      home: BlocProvider(
        create: (context) => SaveHostValueCubit()..checkHostAtCache(),
        child: const StartWidget(),
      ),
    );
  }
}

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveHostValueCubit, SaveHostValueState>(
      builder: (context, state) => state.when(
          initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
          onSave: (host, port) => MainPage(
                host: host,
                port: port,
              ),
          onEnter: () => const LoginPage()),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.host, required this.port});

  final String host;
  final int port;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ViewerRepository? _viewerRepository;
  late RoomRepository _roomRepository;
  late MqttRepository? _mqttRepository;
  late CardControlRepository _cardControlRepository;
  late ControlStateRepository _controlStateRepository;

  @override
  void initState() {
    super.initState();
    String host = 'ws://${widget.host}';
    _roomRepository = RoomRepository();

    _viewerRepository = ViewerRepository(_roomRepository);
    _mqttRepository = MqttRepository(
        host: host, port: widget.port, repository: _roomRepository);
    // _mqttRepository = MqttRepository(
    //     host: 'ws://127.0.0.1', port: 8080, repository: _roomRepository);
    _cardControlRepository = CardControlRepository(
        mqttRepository: _mqttRepository, viewerRepository: _viewerRepository);
    _controlStateRepository = ControlStateRepository(mqttRepository: _mqttRepository);

    _roomRepository
        .loadFromAsset()
        .then((value) => _viewerRepository?.init().then((value) {
              _mqttRepository?.init();
              _controlStateRepository
                  .fillControlByState(_roomRepository.getRooms());
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(value: _viewerRepository),
            RepositoryProvider.value(value: _controlStateRepository),
            RepositoryProvider.value(value: _cardControlRepository)
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ControlCardCubit>(
                create: (context) {
                  return ControlCardCubit(
                    roomRepository: _roomRepository,
                    controlStateRepository: _controlStateRepository,
                  );
                },
              ),
              BlocProvider<UpdateCardDataCubit>(
                create: (context) {
                  return UpdateCardDataCubit(
                    mqttRepository: _mqttRepository,
                    roomRepository: _roomRepository,
                  );
                },
              )
            ],
            child: const ViewerWithBmsWidget(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ViewerWithBmsWidget extends StatelessWidget {
  const ViewerWithBmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ControlCardCubit, ControlCardState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Flexible(
                    flex: 5,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  showControlCard: (widget) => Flexible(flex: 5, child: widget),
                );
              },
            ),
            Flexible(
              flex: 12,
              child: IfcViewerWidget(
                initial: initial,
                onPostMessage:
                    context.read<ViewerRepository>().postViewerStream,
                onReceiveMessage:
                    context.read<ViewerRepository>().getViewerSinkStream,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Введите IP адрес и порт MQTT сервера',
              style: cardHeadTextStyle,
            ),
            Text(
              '(например: 192.168.0.1:1111)',
              style: cardLabelTextStyle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: '192.168.88.103:18831',
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        focusColor: Colors.grey,
                      ),
                      onChanged: (value) => {
                        context
                            .read<SaveHostValueCubit>()
                            .updateHostValue(value)
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<SaveHostValueCubit>().saveHost();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 48,
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
