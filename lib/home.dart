import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_notifications/services/local_notifications_service.dart';

// Cards - Pages
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    LocalNotificationsService.initialize(onNotificationTapped);

    // When the app is in the background, and closed and user
    // taps on the notification it will open an app
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("App is closed, but user tapped on the notification");
        onNotificationTapped(message.data['screen_num']);
      }
    });

    // Foreground work. On opened app, subscribe the widget to the FB Notifications
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print("App is working on the foreground");
        print(message.notification!.body);
        print(message.notification!.title);
        LocalNotificationsService.displayNotification(message);
      }
    });

    // When the app is in the background, but opened and user
    // taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(
          'App is working on the background and user tapped on the notification');
      onNotificationTapped(message.data['screen_num']);
    });
  }

  // selected Widget
  int _selectedIndex = 0;

  // Alternative to Navigator
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

  // On tap (bottm navigation bar)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onNotificationTapped(String route) {
    setState(() {
      _selectedIndex = int.parse(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich',
            // 2
            style: Theme.of(context).textTheme.headline6),
      ),
      // Select choosen page from pages list
      body: pages[_selectedIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        // Show current page on the bottom navbar
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        // Apply function
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}
