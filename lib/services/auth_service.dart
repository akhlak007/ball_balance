import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  String? _userId;
  bool get isAuthenticated => _userId != null;

  Future<bool> signIn(String email, String password) async {
    // TODO: Implement actual authentication
    _userId = 'test_user_id';
    notifyListeners();
    return true;
  }

  Future<void> signOut() async {
    _userId = null;
    notifyListeners();
  }
}