import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Api.dart';

class AuthService extends ChangeNotifier {
  String? sessionId;

  Session? session;

  static Future<void> init() async {
    await Hive.openBox("auth");
  }

  Future<bool> signIn() async {
    sessionId = Hive.box("auth").get("sessionId");

    if (sessionId == null)
    {
      return false;
    }

    final response = await ApiService.retrieveSession(sessionId ?? "");

    if (!response.success)
    {
      return false;
    }

    session = response.data;

    notifyListeners();

    return true;
  }

  Future<void> signOut() async {
    if (sessionId != null)
    {
      await ApiService.deleteSession(sessionId!);

      session = sessionId = null;

      await Hive.deleteBoxFromDisk("auth");

      notifyListeners();
    }
  }
}
