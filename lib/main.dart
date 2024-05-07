import 'package:dartz/dartz.dart';
import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isimm_app5/core/app.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/TeacherSchedule.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/auth.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/data/repository/AuthRepoImpl.dart';
import 'package:isimm_app5/domain/use_cases/login_use_case.dart';
import 'package:isimm_app5/firebase_options.dart';

import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/login/cubit/login_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize ScreenUtil

  initLoginModule();
  runApp(DevicePreview(enabled: true, builder: (context) => MyAppWithCubit()));
  // runApp(MyAppWithCubit());
}

class MyAppWithCubit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginCubit(
          // Provide the necessary dependencies
          loginUseCase(AuthRepoImpl(auth: Authentication(dio: Dio()))),
          TextEditingController(),
          TextEditingController(),
        ),
        child: MyApp(),
      ),
    );
  }
}
