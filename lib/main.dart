import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer_for_stand_v2/cubit/control_card_cubit/control_card_cubit.dart';
import 'package:viewer_for_stand_v2/repository/room_repository.dart';
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

  @override
  void initState() {
    super.initState();
    _roomRepository = RoomRepository();
    _viewerRepository = ViewerRepository(_roomRepository);
    _roomRepository.loadFromAsset().then((value) => _viewerRepository?.init());
  }

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: RepositoryProvider.value(
          value: _viewerRepository,
          child: BlocProvider<ControlCardCubit>(
            create: (context) => ControlCardCubit(
              viewerRepository: _viewerRepository!,
              roomRepository: _roomRepository,
              size: size,
            ),
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
