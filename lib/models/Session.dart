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
}
