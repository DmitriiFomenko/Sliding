import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}
