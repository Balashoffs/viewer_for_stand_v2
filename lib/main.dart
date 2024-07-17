import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/utils/initial/initial.dart';
import 'package:viewer_for_stand_v2/widget/enable_remote_control_widget.dart';
import 'package:viewer_for_stand_v2/widget/ifc_viewer_widget.dart';
import 'package:viewer_for_stand_v2/widget/office_space_widget.dart';




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
    return const SafeArea(
      child: Scaffold(
        body: MainPage(),
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
                      icRemote: (isChecked) async {
                      },
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
                      onCurtainsDown: () async {
                      },
                      onCurtainsUp: () async {
                      },
                      onLightingSwitch: (state) async {
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    OpenSpaceControlWidget(
                      name: 'Кабинет',
                      onCurtainsDown: () async {

                      },
                      onCurtainsUp: () async {

                      },
                      onLightingSwitch: (state) async {

                      },
                    ),
                  ],
                ),
              ),
              // fit: FlexFit.loose,
            ),
            Flexible(
              flex: 12,
              child: IfcViewerWidget(initialFile: initialFile,initialUrlRequest: initialUrlRequest,),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    EnableRemoteControlWidget(
                      icRemote: (isChecked) async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .switchRemoteControl(isChecked);
                      },
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
                      onCurtainsDown: () async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .downCurtainsSpace();
                      },
                      onCurtainsUp: () async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .upCurtainsSpace();
                      },
                      onLightingSwitch: (state) async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .switchLightSpace(state);
                      },
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    OpenSpaceControlWidget(
                      name: 'Кабинет',
                      onCurtainsDown: () async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .downCurtainsCabinet();
                      },
                      onCurtainsUp: () async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .upCurtainsCabinet();
                      },
                      onLightingSwitch: (state) async {
                        // context
                        //     .read<ViewerDeviceControlRepository>()
                        //     .switchLightCabinet(state);
                      },
                    ),
                  ],
                ),
              ),
              // fit: FlexFit.loose,
            ),
          ],
        ),
      ),
    );
  }
}
