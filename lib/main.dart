import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/game_core/game.dart';
import 'package:flutter_game/utilits/global_vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: MyApp(),
          ),
        ),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    initGame();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Game());
  }

  void initGame() {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHaight = MediaQuery.of(context).size.height;
  }
}
