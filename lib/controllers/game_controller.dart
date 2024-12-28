import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

enum GameState { playing, gameOver }

class GameController extends ChangeNotifier {
  final ValueNotifier<double> ballPosition = ValueNotifier<double>(0.0);
  final ValueNotifier<double> beamAngle = ValueNotifier<double>(0.0);
  final ValueNotifier<int> timer = ValueNotifier<int>(0);
  final ValueNotifier<int> totalScore = ValueNotifier<int>(0);
  final ValueNotifier<GameState> gameState = ValueNotifier<GameState>(GameState.playing);

  StreamSubscription? _gyroscopeSubscription;
  Timer? _gameTimer;
  bool _isStable = false;
  int _stableStartTime = 0;

  static const double stabilityThreshold = 0.1;
  static const double maxTiltAngle = 0.5;
  static const int targetDuration = 5;

  GameController() {
    _initializeGyroscope();
  }

  void _initializeGyroscope() {
    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      // Update beam angle based on device tilt
      double newAngle = beamAngle.value + (event.x * 0.1);
      newAngle = newAngle.clamp(-maxTiltAngle, maxTiltAngle);
      beamAngle.value = newAngle;

      // Update ball position based on beam angle
      double newPosition = ballPosition.value + (newAngle * 0.2);
      newPosition = newPosition.clamp(-1.0, 1.0);
      ballPosition.value = newPosition;

      _checkGameState(newPosition, newAngle);
    });
  }

  void _checkGameState(double position, double angle) {
    if (position.abs() >= 0.9 || angle.abs() >= maxTiltAngle) {
      _endGame();
      return;
    }

    if (position.abs() < stabilityThreshold && angle.abs() < stabilityThreshold) {
      if (!_isStable) {
        _isStable = true;
        _stableStartTime = DateTime.now().millisecondsSinceEpoch;
        _startTimer();
      }
    } else {
      if (_isStable) {
        _isStable = false;
        _resetTimer();
      }
    }
  }

  void _startTimer() {
    _gameTimer?.cancel();
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isStable) {
        this.timer.value = timer.tick;
        if (timer.tick >= targetDuration) {
          _handleSuccess();
        }
      }
    });
  }

  void _resetTimer() {
    _gameTimer?.cancel();
    timer.value = 0;
  }

  void _handleSuccess() {
    _gameTimer?.cancel();
    int duration = DateTime.now().millisecondsSinceEpoch - _stableStartTime;
    totalScore.value += (duration ~/ 1000);
    timer.value = 0;
    _isStable = false;
  }

  void _endGame() {
    gameState.value = GameState.gameOver;
    _gameTimer?.cancel();
    _gyroscopeSubscription?.pause();
  }

  void restartGame() {
    ballPosition.value = 0.0;
    beamAngle.value = 0.0;
    timer.value = 0;
    totalScore.value = 0;
    _isStable = false;
    gameState.value = GameState.playing;
    _gyroscopeSubscription?.resume();
  }

  void dispose() {
    _gyroscopeSubscription?.cancel();
    _gameTimer?.cancel();
    super.dispose();
  }
}