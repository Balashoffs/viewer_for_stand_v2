import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/control_card_cubit/control_card_cubit.dart';
import 'package:viewer_for_stand_v2/cubit/update_card_data/update_card_data_cubit.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
import 'package:viewer_for_stand_v2/service/card_control_service/card_control_service.dart';
import 'package:viewer_for_stand_v2/service/mqtt/mqtt_repository.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/ifc_viewer_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';

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
    print('MyApp build');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ViewerRepository? _viewerRepository;
  late RoomRepository _roomRepository;
  late MqttRepository? _mqttRepository;

  @override
  void initState() {
    super.initState();
    _roomRepository = RoomRepository();
    _viewerRepository = ViewerRepository(_roomRepository);
    // _mqttRepository = MqttRepository('ws://192.168.88.189', 1884);
    _mqttRepository = MqttRepository('ws://127.0.0.1', 8080);
    _roomRepository.loadFromAsset().then((value) => _viewerRepository?.init().then((value) => _mqttRepository?.init()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RepositoryProvider.value(
          value: _viewerRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<ControlCardCubit>(
                create: (context) {
                  return ControlCardCubit(
                    roomRepository: _roomRepository,
                    cardControlService: CardControlService(
                      mqttRepository: _mqttRepository,
                    ),
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
            child: MainPage(),
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

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                  initial: () => SizedBox(),
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
