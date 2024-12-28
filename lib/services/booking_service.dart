import '../models/session.dart';

class BookingService {
  Future<Session> bookSession({
    required String expertId,
    required DateTime scheduledTime,
    required int durationMinutes,
  }) async {
    // TODO: Implement actual booking logic
    return Session(
      id: DateTime.now().toString(),
      expertId: expertId,
      userId: 'test_user_id',
      scheduledTime: scheduledTime,
      durationMinutes: durationMinutes,
      price: 1000,
    );
  }
}