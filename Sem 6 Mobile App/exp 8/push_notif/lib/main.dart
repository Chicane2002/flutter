import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Local Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showNotification(context),
          child: Text('Show Notification'),
        ),
      ),
    );
  }

  Future<void> _showNotification(BuildContext context) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id', // Unique identifier for the channel.
      'General Notifications', // User-visible name of the channel.
      importance: Importance.max,
      priority: Priority.high,
      icon: 'minosprimecutout',
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Notification',
      'Thy end is now!',
      platformChannelSpecifics,
    );
  }
}
