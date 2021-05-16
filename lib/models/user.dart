import 'package:glance/models/model.dart';
import 'package:meta/meta.dart';

abstract class User extends Model {
  int get id;
  String get firstName;
  String get lastName;
  String get username;
  String get password;
}

class EmailUser extends User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;

  EmailUser({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.username,
    @required this.password,
  });

  factory EmailUser.fromMap(Map<String, dynamic> map) {
    return EmailUser(
      id: map["id"],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      username: map['username'],
      password: null,
    );
  }

  factory EmailUser.fromLoginMap(Map<String, dynamic> map) {
    return EmailUser(
      id: map["user_id"],
      firstName: map["first_name"],
      lastName: map["last_name"],
      email: map["email"],
      username: map["username"],
      password: null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User[id: $id, firstName:$firstName, lastName:$lastName, email:$email, username:$username]';
  }
}
