import 'package:flutter/material.dart';
import 'package:flutter_game/scenes/app_scene.dart';
import 'package:flutter_game/utilits/player.dart';

class GameScene extends AppScene {
  final Player _player = Player();

  @override
  Widget buildScene() {
    return Stack(
      children: [_player.build()],
    );
  }

  @override
  void update() {
    _player.update();
  }
}
