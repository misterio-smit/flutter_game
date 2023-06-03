import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/entites/entity.dart';
import 'package:flutter_game/utilits/global_vars.dart';

class Player extends Entity {
  Player() : super("player") {
    x = 50;
    y = 150;
  }
  final double _speed = 3;
  double _angel = 0;
  double _degree = 0;

  bool isMoveLeft = false;
  bool isMoveRight = false;

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible
          ? Transform.rotate(
              angle: _angel,
              child: sprites.first,
            )
          : const SizedBox(),
    );
  }

  @override
  void move() {
    if (isMoveLeft) _degree -= 3;
    if (isMoveRight) _degree += 3;

    _angel = (_degree * 3.14) / 180;

    x += sin(_degree * 0.0175) * _speed;
    y -= cos(_degree * 0.0175) * _speed;

    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    if (x > GlobalVars.screenWidth - 50) {
      x = GlobalVars.screenWidth - 50;
    }
    if (y > GlobalVars.screenHaight - 50) {
      y = GlobalVars.screenHaight - 50;
    }

    isMoveLeft = false;
    isMoveRight = false;
  }

  @override
  void update() {
    move();
  }
}
