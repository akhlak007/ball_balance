import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class Ball extends StatelessWidget {
  final GameController controller;

  const Ball({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: controller.ballPosition,
      builder: (context, position, _) {
        return AnimatedAlign(
          alignment: Alignment(position, 0),
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue[600],
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
              gradient: RadialGradient(
                colors: [Colors.blue[400]!, Colors.blue[600]!],
                center: Alignment.topLeft,
                radius: 0.8,
              ),
            ),
          ),
        );
      },
    );
  }
}