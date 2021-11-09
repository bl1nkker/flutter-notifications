import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundNotificationHandler(RemoteMessage message) async {
  print("App is closed");
  print(message.notification!.body);
  print(message.notification!.title);
}
