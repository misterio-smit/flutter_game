import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game/game_core/main_loop.dart';
import 'package:flutter_game/utilits/common_vars.dart';
import 'package:flutter_game/utilits/player.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late ReceivePort _receivePort;
  late Isolate isolateLoop;
  late Player player;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStateGame) {
      startIsolateLoop();
      isFirstStateGame = false;
      player = Player();
    }
    player.update();

    return Stack(
      children: [player.build()],
    );
  }
}
