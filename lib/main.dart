import 'package:flutter/material.dart';
import 'calculator_screen.dart' show CalculateScreen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculateScreen(),
      title: "Flutter Calculator",
      theme: ThemeData.dark(),
    );
  }
}
