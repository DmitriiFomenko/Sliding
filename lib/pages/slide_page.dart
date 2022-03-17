import 'package:damp/pages/animation_box.dart';
import 'package:flutter/material.dart';

class SlidePage extends StatelessWidget {
  const SlidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: const SafeArea(
        child: AnimationBox(),
      ),
    );
  }
}
