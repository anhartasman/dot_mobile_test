// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// A user of the application.
class UserProfile {
  final int id;
  final String username;
  final String fullname;
  final String email;
  final String phone;
  final String avatar;
  UserProfile({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.avatar,
  });

  UserProfile copyWith({
    int? id,
    String? username,
    String? fullname,
    String? email,
    String? phone,
    String? avatar,
  }) {
    return UserProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] as int,
      username: map['username'] as String,
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfile(id: $id, username: $username, fullname: $fullname, email: $email, phone: $phone, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant UserProfile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.fullname == fullname &&
        other.email == email &&
        other.phone == phone &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        fullname.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        avatar.hashCode;
  }
}
