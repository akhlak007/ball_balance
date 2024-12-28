import 'package:flutter/material.dart';
import '../widgets/balance_beam.dart';
import '../widgets/ball.dart';
import '../widgets/timer_display.dart';
import '../controllers/game_controller.dart';
import 'game_over_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late GameController _gameController;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
  }

  @override
  void dispose() {
    _gameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balance Challenge'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                TimerDisplay(controller: _gameController),
                Expanded(
                  child: Stack(
                    children: [
                      BalanceBeam(controller: _gameController),
                      Ball(controller: _gameController),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ValueListenableBuilder<int>(
                    valueListenable: _gameController.totalScore,
                    builder: (context, score, _) {
                      return Text(
                        'Total Score: $score',
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                    },
                  ),
                ),
              ],
            ),
            ValueListenableBuilder<GameState>(
              valueListenable: _gameController.gameState,
              builder: (context, gameState, _) {
                if (gameState == GameState.gameOver) {
                  return GameOverScreen(
                    controller: _gameController,
                    finalScore: _gameController.totalScore.value,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}