abstract class LoginRespnseError {
  static String error(int statusCode) {
    if (statusCode == 404) {
      return "لا يوجد مستخدم بهذا الرقم";
    }
    if (statusCode == 401) {
      return "كلمة المرور خاطئة";
    }
    return "هناك مشكلة في الخادم";
  }
}
