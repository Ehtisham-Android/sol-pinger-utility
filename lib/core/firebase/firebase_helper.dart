import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../../locator.dart';
import '../constants/app_shared_prefs.dart';

class FirebaseHelper {
  final _firebaseMessage = FirebaseMessaging.instance;
  final prefs = locator<AppSharedPref>();

  Future<void> initNotifications() async {
    _firebaseMessage.requestPermission();
    await Future.delayed(const Duration(seconds: 3));
    final fcmToken = await _firebaseMessage.getToken();
    prefs.fcmToken = fcmToken ?? '';

    if (kDebugMode) {
      print('Token: $fcmToken');
    }
  }
}