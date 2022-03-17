import 'package:flutter/material.dart';

class MyTransforms extends StatelessWidget {
  const MyTransforms({
    Key? key,
    required this.offset,
    required this.angle,
    required this.child,
  }) : super(key: key);

  final Offset offset;
  final double angle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: angle,
        child: child,
      ),
    );
  }
}
