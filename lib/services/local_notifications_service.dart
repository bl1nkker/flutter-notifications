import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize(Function onNotificationTapped) {
    // Here we specify setting on each platform
    // @mipmap/ic_launcher - icon, that will be shown on the notification icon
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    // When user taps on the notification when the app is in the foreground
    _notificationPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        onNotificationTapped(route);
      }
    });
  }

  // This will show notification when an app work on the foreground,
  static void displayNotification(RemoteMessage message) async {
    try {
      // Generate unic notification ID
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      // Specifying notification details
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("bl1nkker", "bl1nkker channel",
              channelDescription: "This is our Notification Channel ID",
              importance: Importance.max,
              priority: Priority.high));
      await _notificationPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: message.data['screen_num']);
    } catch (e) {
      print("There are some error with the local_notif_service: $e");
    }
  }
}
