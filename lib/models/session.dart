import 'package:flutter/foundation.dart';

enum SessionStatus { scheduled, ongoing, completed, cancelled }

class Session {
  final String id;
  final String expertId;
  final String userId;
  final DateTime scheduledTime;
  final int durationMinutes;
  final double price;
  final SessionStatus status;

  Session({
    required this.id,
    required this.expertId,
    required this.userId,
    required this.scheduledTime,
    required this.durationMinutes,
    required this.price,
    this.status = SessionStatus.scheduled,
  });
}