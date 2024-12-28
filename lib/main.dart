import 'package:flutter/material.dart';
import 'screens/game_screen.dart';



void main() {
  runApp(const BalanceGameApp());
}

class BalanceGameApp extends StatelessWidget {
  const BalanceGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balance Ball Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GameScreen(),
    );
  }
}