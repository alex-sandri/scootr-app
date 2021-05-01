import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Api.dart';

class AuthService {
  static String? sessionId;

  static Session? session;

  static Future<bool> init() async {
    AuthService.sessionId = "ses_e3a0dde1372250c92ad7c5681a7a63e3a63d6a1e94dbded4606e4f27722ccbb6a940e47611bfee4bc20eba93b3de306b6236";

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
}
