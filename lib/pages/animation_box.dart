import 'package:damp/class/state_animation.dart';
import 'package:damp/widgets/my_box.dart';
import 'package:damp/widgets/my_transforms.dart';
import 'package:flutter/material.dart';

//https://easings.net/
class AnimationBox extends StatefulWidget {
  const AnimationBox({Key? key}) : super(key: key);

  @override
  _AnimationBoxState createState() => _AnimationBoxState();
}

class _AnimationBoxState extends State<AnimationBox>
    with SingleTickerProviderStateMixin {
  StateAnimation stateAnimation = StateAnimation();
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    controller.addListener(
      () {
        if (controller.status == AnimationStatus.completed) {
          stateAnimation.toDefaultValue();
          controller.reset();
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerEvent details) {
    stateAnimation.controller = controller;
    setState(() {
      stateAnimation.tapDown(details);
    });
  }

  void _onPointerUp(PointerEvent details) {
    setState(() {
      stateAnimation.tapUp(details);
    });
  }

  void _onPointerMove(PointerEvent details) {
    setState(
      () {
        stateAnimation.updatePos(details);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, childContainer) {
          return Listener(
            onPointerDown: _onPointerDown,
            onPointerMove: _onPointerMove,
            onPointerUp: _onPointerUp,
            child: MyTransforms(
              offset: stateAnimation.getOffset(),
              angle: stateAnimation.angle.value,
              child: const MyBox(),
            ),
          );
        },
      ),
    );
  }
}
