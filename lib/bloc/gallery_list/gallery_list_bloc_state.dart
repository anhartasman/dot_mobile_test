// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';

class GalleryListBlocState extends Equatable {
  final bool onLoading;
  final List<Gallery> galleryList;
  final bool onError;
  final String errorMessage;
  const GalleryListBlocState({
    this.onLoading = false,
    this.galleryList = const [],
    this.onError = false,
    this.errorMessage = "",
  });

  @override
  List<Object> get props => [onLoading, galleryList, onError, errorMessage];

  GalleryListBlocState copyWith({
    bool? onLoading,
    List<Gallery>? galleryList,
    bool? onError,
    String? errorMessage,
  }) {
    return GalleryListBlocState(
      onLoading: onLoading ?? this.onLoading,
      galleryList: galleryList ?? this.galleryList,
      onError: onError ?? this.onError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'onLoading': onLoading,
      'galleryList': galleryList.map((x) => x.toMap()).toList(),
      'onError': onError,
      'errorMessage': errorMessage,
    };
  }

  factory GalleryListBlocState.fromMap(Map<String, dynamic> map) {
    return GalleryListBlocState(
      onLoading: map['onLoading'] as bool,
      galleryList: List<Gallery>.from(
        (map['galleryList'] as List<int>).map<Gallery>(
          (x) => Gallery.fromMap(x as Map<String, dynamic>),
        ),
      ),
      onError: map['onError'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryListBlocState.fromJson(String source) =>
      GalleryListBlocState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
