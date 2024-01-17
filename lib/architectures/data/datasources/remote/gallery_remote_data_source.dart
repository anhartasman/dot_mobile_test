import 'dart:convert';

import 'package:dot_mobile_test/architectures/data/datasources/dataparser/ParserGallery.dart';
import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';
import 'package:dot_mobile_test/config/config_url.dart';
import 'package:dot_mobile_test/services/service_api.dart';
import 'package:flutter/widgets.dart';

class GalleryRemoteDataSource {
  static Future<List<Gallery>> galleryList() async {
    final apiURL = GALLERY_URL;
    final responsePost = await ServiceAPI.getAPI(
      URL: apiURL,
      query: {},
    );

    final responAPI = responsePost;
    if (responAPI["status_code"] != 200) {
      throw (responAPI["message"].toString());
    }

    List<Gallery> galleryList = [];

    final dataMap = responAPI["data"]!;

    dataMap.asMap().forEach((idx, key) {
      try {
        galleryList.add(ParserGallery.fromAPIResult(key));
      } catch (e) {
        debugPrint("error when parsing JSON Gallery " + jsonEncode(key));
        debugPrint(e.toString());
      }
    });

    return galleryList;
    //end of galleryList
  }
}
