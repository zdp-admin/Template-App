import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();
  Future<SharedPreferences> sPref = SharedPreferences.getInstance();

  var initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
      iOS: IOSInitializationSettings(
          defaultPresentAlert: true,
          defaultPresentBadge: true,
          defaultPresentSound: true,
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
          onDidReceiveLocalNotification:
              PushNotificationProvider.onDidReceiveLocalHotification));

  PushNotificationProvider() {
    this.initNotifications();
    this.localNotifications.initialize(initializationSettings,
        onSelectNotification: PushNotificationProvider.onSelectNotification);
  }

  void initNotifications() {
    _firebaseMessaging.requestPermission(sound: true, alert: true, badge: true);

    /*-----------------------------------------------COMENTADO POR PRUEBA
    _firebaseMessaging.onIosSettingsRegistered-------
        .listen((NotificationSettings event) {-------
      print('Settgins register $event');
    });*/

    _firebaseMessaging.getToken().then((tokenDevices) async {
      final SharedPreferences pref = await this.sPref;
      pref.setString('token_device', tokenDevices);
      print(tokenDevices);
    });

    /*  _firebaseMessaging.configure(
        // cuando la aplicacion esta abierta
        onMessage: (Map<String, dynamic> message) async {
          print('======== ON MESSAGE ========');
          print(message);

          final SharedPreferences pref = await this.sPref;
          bool singOff = false;
          if (Platform.isIOS) {
            PushNotificationProvider.showNotification(
                message['notification']['title'],
                message['notification']['body'],
                null);
            singOff = (message['sign_off'] ?? "false") == "true";
          } else {
            PushNotificationProvider.showNotification(
                message['notification']['title'],
                message['notification']['body'],
                null);
            singOff = (message['data']['sign_off'] ?? "false") == "true";
          }

          if (singOff) {
            pref.setInt('id', 0);
            pref.setString('email', '');
            pref.setString('card_number', '');
            pref.setBool('logged', false);
            pref.setString('telephone', '');
          }

          return;
        },
        // cuando se reciba una notifiacion
        onLaunch: (message) {
          print('======= ON LAUNCH ======');
          print(message);

          return;
        },
        //cuando la aplicacion esta cerrada
        onResume: (message) async {
          print('======== ON RESUME ===========');
          print(message);

          final SharedPreferences pref = await this.sPref;
          bool singOff = false;

          if (Platform.isIOS) {
            PushNotificationProvider.showNotification(
                message['notification']['title'],
                message['notification']['body'],
                null);
            singOff = (message['sign_off'] ?? "false") == "true";
          } else {
            PushNotificationProvider.showNotification(
                message['notification']['title'],
                message['notification']['body'],
                null);
            singOff = (message['data']['sign_off'] ?? "false") == "true";
          }

          if (singOff) {
            pref.setInt('id', 0);
            pref.setString('email', '');
            pref.setString('card_number', '');
            pref.setBool('logged', false);
            pref.setString('telephone', '');
          }

          return;
        },
        onBackgroundMessage: Platform.isIOS
            ? null
            : PushNotificationProvider.myBackgroundMessageHandler);
  }*/
  }

  static Future<dynamic> onDidReceiveLocalHotification(
      int id, String title, String body, String payload) async {
    return;
  }

  static Future<dynamic> onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  static Future<void> showNotification(
      String title, String message, dynamic extra) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id', 'channel name', 'channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticket');

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await PushNotificationProvider()
        .localNotifications
        .show(0, title, message, platformChannelSpecifics, payload: 'item x');
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {}

    if (message.containsKey('notification')) {}

    print(message);
  }
}
