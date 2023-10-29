import 'package:architecture/domain/entites/user.dart';

class FirebaseUserJson {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;

  FirebaseUserJson({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'phone': phone,
      };

  User toDomain() => const User.empty().copywith(
        id: id.toString(),
        name: name,
        username: username,
        email: email,
        phone: phone,
      );

  factory FirebaseUserJson.fromJson(Map<String, dynamic> json) =>
      FirebaseUserJson(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
      );
}
