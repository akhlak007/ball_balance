import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class BalanceBeam extends StatelessWidget {
  final GameController controller;

  const BalanceBeam({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: controller.beamAngle,
      builder: (context, angle, _) {
        return Center(
          child: Transform.rotate(
            angle: angle,
            child: Container(
              width: 300,
              height: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[300]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}