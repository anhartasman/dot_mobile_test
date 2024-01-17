// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/architectures/domain/entities/UserAccount.dart';

class PlaceListBlocState extends Equatable {
  final bool onLoading;
  final List<Place> placeList;
  final bool onError;
  final String errorMessage;
  const PlaceListBlocState({
    this.onLoading = false,
    this.placeList = const [],
    this.onError = false,
    this.errorMessage = "",
  });

  @override
  List<Object> get props => [onLoading, placeList, onError, errorMessage];

  PlaceListBlocState copyWith({
    bool? onLoading,
    List<Place>? placeList,
    bool? onError,
    String? errorMessage,
  }) {
    return PlaceListBlocState(
      onLoading: onLoading ?? this.onLoading,
      placeList: placeList ?? this.placeList,
      onError: onError ?? this.onError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'onLoading': onLoading,
      'placeList': placeList.map((x) => x.toMap()).toList(),
      'onError': onError,
      'errorMessage': errorMessage,
    };
  }

  factory PlaceListBlocState.fromMap(Map<String, dynamic> map) {
    return PlaceListBlocState(
      onLoading: map['onLoading'] as bool,
      placeList: List<Place>.from(
        (map['placeList'] as List<int>).map<Place>(
          (x) => Place.fromMap(x as Map<String, dynamic>),
        ),
      ),
      onError: map['onError'] as bool,
      errorMessage: map['errorMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceListBlocState.fromJson(String source) =>
      PlaceListBlocState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
