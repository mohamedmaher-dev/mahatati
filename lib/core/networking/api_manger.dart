import 'package:dio/dio.dart';

abstract class APIManger {
  static const String baseUrl = "https://ahmed.ym-apps.com/api/";
  static final BaseOptions _dioOptions = BaseOptions(
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    validateStatus: (_) => true,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  );
  static final Dio _dio = Dio()..options = _dioOptions;

  static Future<Response> get(
    String endpoint,
  ) async {
    Response response = await _dio.get(
      endpoint,
    );
    return response;
  }

  static Future<Response> postData(
    String endpoint,
    Map data,
  ) async {
    Response response = await _dio.post(
      endpoint,
      data: data,
    );
    return response;
  }

  static Future<Response> patch(
    String endpoint,
    Map data,
  ) async {
    Response response = await _dio.patch(
      endpoint,
      data: data,
    );
    return response;
  }
}
