import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FCMManger {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static init() async {
    await _requestPermission();
    await _backgroundFCM();
    await _foregroundFCM();
    await _getToken();
    await _subscribeToAll();
  }

  static Future<void> _requestPermission() async {
    await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<void> _foregroundFCM() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {},
    );
  }

  static Future<void> _backgroundFCM() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _subscribeToAll() async {
    await _fcm.subscribeToTopic("all");
  }

  static Future<void> _getToken() async {
    String? token = await _fcm.getToken();
    print(token.toString());
  }

  static send({required String title, required String body}) async {
    final Dio dio = Dio();
    const String fcmUrl = "https://fcm.googleapis.com/fcm/send";
    const String serverToken =
        "AAAA8QT_PB4:APA91bHmu2eXvjTA26HOGLth45GmM9zxU9z2VgzILn27Ew_jM_4jfTbCWORcIIA8FBysnM185Ya8yXubq4ceWaUfLU_mSkYLK4wQqtwLEhZ2BXpUDgPaKxAXM8voM5Ln1An7soEd4D2s";
    await dio.post(
      fcmUrl,
      options: Options(
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverToken',
        },
      ),
      data: <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body,
          'title': title,
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done'
        },
        'to': "/topics/all",
      },
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    print(message.toMap().toString());
  } else {
    print("Background FCM Not Working");
  }
}
