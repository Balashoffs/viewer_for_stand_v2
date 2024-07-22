import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/enable_remote_control_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/ifc_viewer_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_frame/repository/viewer_repository.dart';
import 'package:viewer_for_stand_v2/widget/office_space_widget.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // late ViewerDeviceControlRepository _deviceControlRepository;

  @override
  void initState() {
    super.initState();
    // _deviceControlRepository = ViewerDeviceControlRepository();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RepositoryProvider<ViewerRepository>(
          create: (context) => ViewerRepository()..init(),
          child: MainPage(),
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
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    EnableRemoteControlWidget(
                      icRemote: (isChecked) async {},
                    ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.deepPurple,
                    ),
                    OpenSpaceControlWidget(
                      name: 'Пространство',
                      onCurtainsDown: () async {},
                      onCurtainsUp: () async {},
                      onLightingSwitch: (state) async {},
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    OpenSpaceControlWidget(
                      name: 'Кабинет',
                      onCurtainsDown: () async {},
                      onCurtainsUp: () async {},
                      onLightingSwitch: (state) async {},
                    ),
                  ],
                ),
              ),
              // fit: FlexFit.loose,
            ),
            Flexible(
              flex: 12,
              child: IfcViewerWidget(
                initial: initial,
                onPostMessage: context.read<ViewerRepository>().postStream,
                onReceiveMessage:
                    context.read<ViewerRepository>().getSinkStream,
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  SecuritySettingsWidget(),
                  ElectricitySupplyWidget(),
                  ClimateInfoWidget(),
                ],
              ),
              // fit: FlexFit.loose,
            ),
          ],
        ),
      ),
    );
  }
}
