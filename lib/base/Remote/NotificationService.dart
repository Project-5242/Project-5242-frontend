import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  PushNotification notification = PushNotification(
    title: message.notification?.title,
    body: message.notification?.body,
  );
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  if (notificationResponse.input?.isNotEmpty ?? false) {}

  if (notificationResponse.notificationResponseType ==
      NotificationResponseType.selectedNotification) {}
}

class NotificationService {
  NotificationService();

  final messaging = FirebaseMessaging.instance;
  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> registerNotification() async {
    await Future.delayed(const Duration(seconds: 1));
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    await listenMessage();
    await checkIntialMessage();
    await setup();
  }

  Future<void> checkIntialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print(
          "initialMessage.notification?.body is ${initialMessage.notification?.body} and title ${initialMessage.notification?.title}");
      PushNotification notification = PushNotification(
          title: initialMessage.notification?.title,
          body: initialMessage.notification?.body);

      showLocalNotification(notification.title ?? "", notification.body ?? "",
          jsonEncode(initialMessage.data));
    }
  }

  Future<void> listenMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String userId = message.data['id'] ?? "";

      print("message.notification?.body is ${message.notification?.body}");
      print(
          "message.notification?.body is title ${message.notification?.title}");

      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );

      showLocalNotification(notification.title ?? "", notification.body ?? "",
          jsonEncode(message.data));
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
          type: message.data["type"] ?? "",
          id: message.data["id"] ?? "");
    });

    FirebaseMessaging.onBackgroundMessage(
            (message) => firebaseMessagingBackgroundHandler(message));
  }

  showLocalNotification(String title, String body, String payload) {
    const androidNotificationDetails =
    AndroidNotificationDetails('0', 'general');
    const iosNotificationDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      iOS: iosNotificationDetail,
      android: androidNotificationDetails,
    );
    localNotification.show(0, title, body, notificationDetails,
        payload: payload);
  }

  Future<void> setup() async {
    const androidInitializationSetting =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSetting = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
    await localNotification.initialize(initSettings,

        // onDidReceiveBackgroundNotificationResponse: (details) {
        //   print("tap on details ");
        // },
        onDidReceiveNotificationResponse: (details) {
          // print("details is ${details.}")
          String body = details.payload ?? "";
          if (details.notificationResponseType ==
              NotificationResponseType.selectedNotification) {}
          // myBackgroundHandler(details);
        }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
  }
}

class PushNotification {
  String? title, id;
  String? type;
  String? profilePic;
  String? name;
  String? body;
  PushNotification({
    this.title,
    this.body,
    this.type,
    this.id,
    this.profilePic,
    this.name,
  });
}