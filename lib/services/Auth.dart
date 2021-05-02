import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Api.dart';

class AuthService extends ChangeNotifier {
  Session? session;

  static Future<void> init() async {
    await Hive.openBox("auth");
  }

  Future<bool> signIn() async {
    final String? sessionId = Hive.box("auth").get("sessionId");

    if (sessionId == null)
    {
      return false;
    }

    final response = await ApiService.retrieveSession(sessionId);

    if (!response.success)
    {
      return false;
    }

    session = response.data;

    notifyListeners();

    return true;
  }

  Future<void> signOut() async {
    if (session != null)
    {
      await ApiService.deleteSession(session!.id);

      session = null;

      await Hive.deleteBoxFromDisk("auth");

      notifyListeners();
    }
  }
}
