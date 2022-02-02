import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) {
    return dio!.post(url, data: data);
  }
}
