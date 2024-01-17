// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// A user of the application.
class Gallery {
  final String caption;
  final String thumbnail;
  final String image;
  Gallery({
    required this.caption,
    required this.thumbnail,
    required this.image,
  });

  Gallery copyWith({
    String? caption,
    String? thumbnail,
    String? image,
  }) {
    return Gallery(
      caption: caption ?? this.caption,
      thumbnail: thumbnail ?? this.thumbnail,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caption': caption,
      'thumbnail': thumbnail,
      'image': image,
    };
  }

  factory Gallery.fromMap(Map<String, dynamic> map) {
    return Gallery(
      caption: map['caption'] as String,
      thumbnail: map['thumbnail'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gallery.fromJson(String source) =>
      Gallery.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Gallery(caption: $caption, thumbnail: $thumbnail, image: $image)';

  @override
  bool operator ==(covariant Gallery other) {
    if (identical(this, other)) return true;

    return other.caption == caption &&
        other.thumbnail == thumbnail &&
        other.image == image;
  }

  @override
  int get hashCode => caption.hashCode ^ thumbnail.hashCode ^ image.hashCode;
}
