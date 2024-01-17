// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A user of the application.
class Place {
  final String id;
  final String title;
  final String content;
  final String type;
  final String image;
  final List<String> media;
  Place({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.image,
    required this.media,
  });

  Place copyWith({
    String? id,
    String? title,
    String? content,
    String? type,
    String? image,
    List<String>? media,
  }) {
    return Place(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      image: image ?? this.image,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'image': image,
      'media': media,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      type: map['type'] as String,
      image: map['image'] as String,
      media: List<String>.from((map['media'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) =>
      Place.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Place(id: $id, title: $title, content: $content, type: $type, image: $image, media: $media)';
  }

  @override
  bool operator ==(covariant Place other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.type == type &&
        other.image == image &&
        listEquals(other.media, media);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        type.hashCode ^
        image.hashCode ^
        media.hashCode;
  }
}
