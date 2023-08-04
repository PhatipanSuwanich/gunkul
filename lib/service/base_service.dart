import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseService {
  final _dio = Dio();

  Future<dynamic> getHttps(String path) async {
    final response = await _dio.get(path);
    return response.data;
  }

  Future<dynamic> postHttps(String path, {Map<String, dynamic>? body}) async {
    try {
      var response = await _dio.post(path, data: body);
      return response.data;
    } on DioException catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red, colorText: Colors.black);
      return Future.error(e);
    }
  }
}
