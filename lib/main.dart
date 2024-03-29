import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:project/src/core/shared/local_notifications.dart';
import 'package:project/src/core/shared/notifications.dart';
import 'package:project/src/core/shared/preferences/preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/ui/pages/login/login_page.dart';

final not = NotificationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesClass.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCxGYb73mwjQkbm1mDGPgXTSq73HMjKLTs',
    appId: '1:529575658167:android:6d9172aad90ebb7b7cc332',
    messagingSenderId: '529575658167',
    projectId: 'alarma-488b1',
  ));
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Notifications().init();
  await not.initNotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'es';
    initializeDateFormatting(
      'az',
    );
    return MaterialApp(
      title: 'Material App',
      home: NotificationListener<MyNotification>(
        onNotification: (MyNotification notification) {
          return true;
        },
        child: const LoginPage(),
      ),
    );
  }
}

class MyNotification extends Notification {
  final String? title;

  const MyNotification({this.title});
}
