import 'package:flutter/material.dart';
import 'package:flutter_game/scenes/app_scene.dart';
import 'package:flutter_game/utilits/global_vars.dart';
import 'package:flutter_game/entites/player.dart';

class GameScene extends AppScene {
  final Player _player = Player();
  double _startGlobalPositions = 0;

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
          top: 0.5,
          left: 0,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHaight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
        Positioned(
          top: 0.5,
          left: GlobalVars.screenWidth / 2 + 1,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
            width: GlobalVars.screenWidth / 2 - 1,
            height: GlobalVars.screenHaight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPositions = details.globalPosition.dx;
    print("position: $_startGlobalPositions");
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if (updateGlobalPosition > _startGlobalPositions + 30) {
      //right
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPositions + 30) {
      // left
      _player.isMoveLeft = true;
    }
  }
}
