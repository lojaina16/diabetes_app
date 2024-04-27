import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  final Dio dio = Dio();
  final String? baseUrl;

  DioHelper({
    this.baseUrl,
  }) {
    dio.options
      ..baseUrl = baseUrl ?? ''
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

  Future<Either<String?, dynamic>> get(String url,
      {Map<String, dynamic>? body}) async {
    try {
      final responses = await dio.get(url,
          queryParameters: body,
          
          options: Options(headers: {
            'X-RapidAPI-Key':
                '37f8277c17msh54ca74cca7b2e64p188138jsn727e5b478eb0',
            'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
          }));
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
