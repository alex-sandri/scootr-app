import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Api.dart';

class AuthService {
  static Session? session;

  static Future<bool> init() async {
    final String sessionId = "";

/*
    if (sessionId == null)
    {
      return false;
    }*/

    final response = await ApiService.retrieveSession(sessionId);

    if (!response.success)
    {
      return false;
    }

    AuthService.session = response.data;

    return true;
  }
}
