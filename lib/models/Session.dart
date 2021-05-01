import 'package:scootr/models/User.dart';

class Session {
  final String id;
  final User user;
  final DateTime expiresAt;

  const Session({
    required this.id,
    required this.user,
    required this.expiresAt,
  });

  static Session deserialize(Map<String, dynamic> json) {
    return Session(
      id: json["id"],
      user: User.deserialize(json["user"]),
      expiresAt: DateTime.parse(json["expires_at"]),
    );
  }
}
