import 'package:damp/pages/main_page.dart';
import 'package:damp/pages/slide_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const App(),
    );

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      routes: {
        '/': (_) => const MainPage(),
        '/Slide': (_) => const SlidePage(),
      },
    );
  }
}
