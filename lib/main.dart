import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:isimm_app5/core/app.dart';

import 'package:isimm_app5/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  initLoginModule();

  runApp(MyApp());
 // runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
  //
}
