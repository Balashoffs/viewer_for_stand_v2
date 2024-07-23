import 'package:flutter/material.dart';
import 'package:viewer_for_stand_v2/widget/climate_widget.dart';
import 'package:viewer_for_stand_v2/widget/electrical_widget.dart';
import 'package:viewer_for_stand_v2/widget/security_widget.dart';


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
          child: BlocProvider<ControlCardCubit>(
            create: (context) => ControlCardCubit(),
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
                  initial: () => SizedBox.shrink(),
                  switchControlCard: (type, roomId) {
                    switch (type) {
                      case CardControlType.workroom:
                        return Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                OpenSpaceControl2Widget(
                                  spaceName: 'Пространство 1',
                                  onCurtainsSwitch: (p0) {},
                                  onLightingSwitch: (p0) {},
                                  spaceIconPath: 'assets/svg/booking_on.svg',
                                ),
                                ClimateInfoWidget(),
                              ],
                            ),
                          ),
                          // fit: FlexFit.loose,
                        );
                      case CardControlType.meetingroom:
                        return Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                MeetingControl2Widget(
                                  spaceName: 'Переговорная 1',
                                  spaceIconPath: 'assets/svg/booking_on.svg', onBookingSwitch: (bool ) {  },
                                ),
                                ClimateInfoWidget(),
                              ],
                            ),
                          ),
                          // fit: FlexFit.loose,
                        );
                      case CardControlType.restroom:
                        return Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Flexible(
                                  child: RestSpaceControl2Widget(
                                    spaceName: 'Кухня',
                                    spaceIconPath: 'assets/svg/booking_on.svg',
                                    onBookingSwitch: (bool) {},
                                  ),
                                ),
                                ClimateInfoWidget(),
                              ],
                            ),
                          ),
                          // fit: FlexFit.loose,
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                );
              },
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SecuritySettingsWidget(),
                  ElectricitySupplyWidget(),
                  TestWidget(),
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
