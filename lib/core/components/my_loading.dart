import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyLoading {
  loading({String? message}) {
    EasyLoading.show(
      status: message,
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  dismiss() {
    EasyLoading.dismiss();
  }

  success(String message) {
    EasyLoading.dismiss();
    EasyLoading.showSuccess(message);
  }

  error(String error) {
    EasyLoading.dismiss();
    EasyLoading.showError(error);
  }
}
