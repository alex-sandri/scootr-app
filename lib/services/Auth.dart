import 'package:scootr/models/User.dart';

class AuthService {
  static User user;

  static Future<bool> init() async {
    return true;
  }
}
