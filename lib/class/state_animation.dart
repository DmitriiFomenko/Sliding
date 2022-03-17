import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'dart:math' as Math;

class StateAnimation {
  StateAnimation() {
    toDefaultValue();
  }

  late AnimationController controller;

  Offset posTapDown = const Offset(0, 0);
  late Offset posLastMove = posTapDown;

  double edge = 70.0;
  late Animation<double> angle;
  late Animation<double> moveDX;
  late Animation<double> moveDY;

  Offset getOffset() {
    return Offset(moveDX.value, moveDY.value);
  }

  void toDefaultValue() {
    angle = const AlwaysStoppedAnimation<double>(0.0);
    moveDX = const AlwaysStoppedAnimation<double>(0.0);
    moveDY = const AlwaysStoppedAnimation<double>(0.0);
  }

  void tapUp(PointerEvent details) {
    updatePos(details);

    if (moveDX.value.abs() == edge) {
      startAnimation();
    } else {
      toDefaultValue();
    }
  }

  void startAnimation() {
    angle = Tween(begin: angle.value, end: moveDX.value.sign * Math.pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutSine,
      ),
    );

    moveDX = Tween(begin: moveDX.value, end: moveDX.value.sign * 400.0)
        .animate(controller);
    controller.forward();
  }

  void tapDown(PointerEvent details) {
    updatePos(details);
    posLastMove = posTapDown = details.position;
  }

  void updatePos(PointerEvent details) {
    moveDX = AlwaysStoppedAnimation<double>(posLastMove.dx - posTapDown.dx);

    useEdge();
    changeAngle();

    posLastMove = details.position;
  }

  void changeAngle() {
    angle =
        AlwaysStoppedAnimation<double>(0.1 * Math.pi * (moveDX.value / edge));
  }

  void useEdge() {
    if (moveDX.value.abs() > edge) {
      moveDX = AlwaysStoppedAnimation<double>(moveDX.value.sign * edge);
    }
  }
}
