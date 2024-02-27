import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/core/utils/routes_manager.dart';
import 'package:isimm_app5/presentation/Studentschedule/view/schedule.dart';
import 'package:isimm_app5/presentation/homescreen/view/homescreen.dart';
import 'package:isimm_app5/presentation/login/view/loginview.dart';
import 'package:isimm_app5/presentation/sendnews/news/news.dart';
import 'package:isimm_app5/presentation/signup/view/signupview.dart';
import 'package:isimm_app5/presentation/teacher/view/teacherview.dart';

import '../presentation/marks/view/studentmarksView.dart';
import '../presentation/teachSchedule/view/TaecherSchedule.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 2, 69, 63))),

      initialRoute: Routes.loginRoute,
    );
  }
}
