import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: TextButton(
          child: const Text('Главная страница'),
          onPressed: () {
            Navigator.pushNamed(context, '/Slide');
          },
        ),
      ),
    );
  }
}
