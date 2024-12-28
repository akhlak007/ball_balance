enum GameState {
  playing,
  gameOver
}

class GameStats {
  final int score;
  final int timeBalanced;
  final int bestScore;

  const GameStats({
    required this.score,
    required this.timeBalanced,
    required this.bestScore,
  });
}