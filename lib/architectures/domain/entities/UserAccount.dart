// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// A user of the application.
class UserAccount {
  final String email;
  UserAccount({
    required this.email,
  });

  UserAccount copyWith({
    String? email,
  }) {
    return UserAccount(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserAccount(email: $email)';

  @override
  bool operator ==(covariant UserAccount other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
