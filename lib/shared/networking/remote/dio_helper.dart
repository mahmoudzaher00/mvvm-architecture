import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://beta.mawasims.com.sa/api/',
              connectTimeout: 50000,
              receiveTimeout: 30000,
              followRedirects: false,
              receiveDataWhenStatusError: true,
              validateStatus: (status) {
                return status! < 500;
              },
      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': lang,
      'Authorization': token,
    };

    return await dio!.get(
      url!,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Accept-Language': lang,
      'Authorization': token,
    };

    return dio!.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String? url,
    @required Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token??'',
    };
    return dio!.put(
      url!,
      queryParameters: query,
      data: data,
    );
  }
}