import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationPlugin notificationPlugin = NotificationPlugin._();

class NotificationPlugin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initializationSettings;

  NotificationPlugin._() {
    init();
  }

  init() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  }

  initializePlatformSpecifics() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        // your call back to the UI
      },
    );

    initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  Future<void> showNotifications(String hotelName) async {
    var android = AndroidNotificationDetails(
        "channel_Id", "channel_Name", "channel_Description");
    var ios = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.show(0, 'Food monkey',
        'your Order is successfully played', platformChannelSpecifics,
        payload: hotelName);
  }
}

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;
  ReceivedNotification(
      {this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}
