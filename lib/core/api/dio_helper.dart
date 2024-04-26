import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio}) {
    dio.options
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..receiveDataWhenStatusError = true;

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor());
    }
  }

  Future<Either<String?, dynamic>> post(
      String url, Map<String, dynamic>? body) async {
    try {
      final responses = await dio.post(url, data: body);
      final status = responses.statusCode;
      final data = responses.data.toString();
      final responseJson = jsonDecode(data);
      if (status == 200) {
        return Right(responseJson);
      } else {
        return Left(
            DioException(requestOptions: responses.requestOptions).message);
      }
    } on DioException catch (e) {
      debugPrint(e.message.toString());
      return Left(e.message);
    }
  }
}
