import 'package:dio/dio.dart';

class DioExp {
  DioException dioException;
  DioExp({required this.dioException});
  String getExp() {
    if (dioException.type == DioExceptionType.receiveTimeout ||
        dioException.type == DioExceptionType.sendTimeout ||
        dioException.type == DioExceptionType.connectionTimeout) {
      return "الأتصال ضعيف ارجو محاولة الاتصال مجددا";
    } else {
      return "تعذر الأتصال بالخادم";
    }
  }
}
