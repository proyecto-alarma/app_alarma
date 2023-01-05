import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    ); // should mention the app icon
    // during initialization itself

    // Ios initialization

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'repeating channel id',
      'repeating channel name',
      channelDescription: 'repeating description',
      playSound: false,
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    log("aaaaaaaaaa");
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/alarma.mp3"),
      autoStart: true,
      showNotification: true,
      playInBackground: PlayInBackground.enabled,
      forceOpen: true,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'repeating title',
      'repeating body',
      notificationDetails,
    );
  }
}
