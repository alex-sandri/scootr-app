class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final String fiscalNumber;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.birthDate,
    required this.fiscalNumber,
  });

  static User deserialize(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      birthDate: DateTime.parse(json["birth_date"]),
      fiscalNumber: json["fiscal_number"],
    );
  }
}
