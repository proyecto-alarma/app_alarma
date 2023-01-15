import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/src/core/shared/preferences/preferences.dart';
import 'package:volume_controller/volume_controller.dart';

class Notifications {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> _background(RemoteMessage message) async {
    //cuando la app esta en segundo en plano
    log("aaaaa1 ${message.data}");
    final player = AudioPlayer();
    final d = AudioSource.asset("assets/alarma.mp3");
    player.setAudioSource(d);
    VolumeController().maxVolume();
    player.play();
  }

  static Future<void> _onbackground(RemoteMessage message) async {
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/alarma.mp3"),
      autoStart: true,
      showNotification: false,
    );
  }

  static Future<void> abirMessage(RemoteMessage message) async {
    final player = AudioPlayer();
    VolumeController().maxVolume();
    final d = AudioSource.asset(
      "assets/alarma.mp3",
    );
    player.setAudioSource(d);
    VolumeController().maxVolume();
    player.play();
  }

  Future<void> init() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    final tokenDevice = await firebaseMessaging.getToken();
    PreferencesClass.setString("tokendevice", tokenDevice.toString());
    FirebaseMessaging.onBackgroundMessage(_background);
    FirebaseMessaging.onMessage.listen(_onbackground);
    FirebaseMessaging.onMessageOpenedApp.listen(abirMessage);
  }
}
