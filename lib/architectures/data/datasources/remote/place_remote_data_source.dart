import 'dart:convert';

import 'package:dot_mobile_test/architectures/data/datasources/dataparser/ParserPlace.dart';
import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/config/config_url.dart';
import 'package:dot_mobile_test/services/service_api.dart';
import 'package:flutter/widgets.dart';

class PlaceRemoteDataSource {
  static Future<List<Place>> placeList() async {
    final apiURL = PLACE_URL;
    final responsePost = await ServiceAPI.getAPI(
      URL: apiURL,
      query: {},
    );

    final responAPI = responsePost;
    if (responAPI["status_code"] != 200) {
      throw (responAPI["message"].toString());
    }

    List<Place> placeList = [];

    final statusData = responAPI["data"]!;

    final contentMap = statusData["content"] ?? [];

    contentMap.asMap().forEach((idx, key) {
      try {
        placeList.add(ParserPlace.fromAPIResult(key));
      } catch (e) {
        debugPrint("error when parsing JSON Place " + jsonEncode(key));
        debugPrint(e.toString());
      }
    });

    return placeList;
    //end of placeList
  }
}
