import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopping_rider/app.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  String oneSignalAppId = "5cd6e5c2-0647-4154-a91f-4c33397d6f3b";

  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.setAppId(oneSignalAppId);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  await Firebase.initializeApp();
  runApp(App());
}
