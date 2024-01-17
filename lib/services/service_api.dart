import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dot_mobile_test/config/const_pesan_error.dart';
import 'package:flutter/services.dart';

class ServiceAPI {
  static Future<Map<String, dynamic>> getAPI({
    required String URL,
    required Map<String, dynamic> query,
  }) async {
    try {
      print("URL ${URL}");

      var dio = Dio();

      final responseDio = await dio.get(
        URL,
        queryParameters: query,
        options: Options(
          responseType: ResponseType.json,
        ),
      );

      if (responseDio.statusCode == 200) {
        print("/// response request ///");
        print(json.encode(responseDio.data));
        return responseDio.data;
      } else {
        throw ("statusCode: " + responseDio.statusCode.toString());
      }
    } catch (error) {
      throw (INTERNET_LEMAH);
      // throw ("network_exception." + error.toString());
    }
  }
}
