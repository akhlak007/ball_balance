import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';

class TimerDisplay extends StatelessWidget {
  final GameController controller;

  const TimerDisplay({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ValueListenableBuilder<int>(
                valueListenable: controller.timer,
                builder: (context, seconds, _) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                        'Balance Time: $seconds / ${GameController.targetDuration}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}