import 'package:hive/hive.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Api.dart';

class AuthService {
  static String? sessionId;

  static Session? session;

  static Future<bool> init() async {
    final box = await Hive.openBox("auth");

    AuthService.sessionId = box.get("sessionId");

    if (AuthService.sessionId == null)
    {
      return false;
    }

    final response = await ApiService.retrieveSession(AuthService.sessionId ?? "");

    if (!response.success)
    {
      return false;
    }

    AuthService.session = response.data;

    return true;
  }

  static Future<void> signOut() async {
    if (AuthService.sessionId != null)
    {
      await ApiService.deleteSession(AuthService.sessionId!);

      AuthService.session = null;
      AuthService.sessionId = null;

      await Hive.deleteBoxFromDisk("auth");
    }
  }
}
