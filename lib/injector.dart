import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/TeacherSchedule.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/firebaseAuth.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/marksRequest.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/presencesheet.dart';
import 'package:isimm_app5/data/repository/marksRepoImpl.dart';
import 'package:isimm_app5/data/repository/presencesheetImlp.dart';
import 'package:isimm_app5/data/repository/repository_impl.dart';
import 'package:isimm_app5/data/repository/teacherScheduleRepoImlp.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';
import 'package:isimm_app5/domain/repository/marksRepo.dart';
import 'package:isimm_app5/domain/repository/presencesheetRepo.dart';
import 'package:isimm_app5/domain/use_cases/marksUseCase.dart';
import 'package:isimm_app5/domain/use_cases/presencesheetUseCase.dart';
import 'package:isimm_app5/domain/use_cases/signupusecase.dart';
import 'package:isimm_app5/domain/use_cases/teacherschedule_UseCase.dart';
import 'package:isimm_app5/presentation/marks/cubit/marksCubit.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_cubit.dart';
import 'package:isimm_app5/presentation/presences_heet/view/presence_sheet.dart';
import 'package:isimm_app5/presentation/signup/cubit/signupcubit.dart';
import 'package:isimm_app5/presentation/teachSchedule/cubit/schedule_cubit.dart';

import 'core/network_info/network_info.dart';
import 'domain/repository/teacherScheduleRepo.dart';
import 'domain/use_cases/login_use_case.dart';
import 'presentation/login/cubit/login_cubit.dart';

final instance = GetIt.instance;

// Future<void> initAppModule() async {
//     instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
//   instance.registerLazySingleton<FirebaseAuthentication>(() => FirebaseAuthentication());
//   instance.registerLazySingleton<Repository>(() => Repositoryimpl(instance(), instance()));
// }

// void initLoginModule() {
//   print("aya wink aa");
//   // Check if loginUseCase is already registered
//   if (!GetIt.I.isRegistered<loginUseCase>()) {
//     // Register Repository before loginUseCase
//     initAppModule();

//     // Register loginUseCase and LoginCubit
//     instance.registerFactory<loginUseCase>(() => loginUseCase(instance()));
//     instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
//   } else {
//     print("c la hachwa");
//   }
// }
Future<void> initAppModule() async {
  if (!GetIt.I.isRegistered<NetworkInfo>()) {
    instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
    instance.registerLazySingleton<FirebaseAuthentication>(
        () => FirebaseAuthentication());

    instance.registerLazySingleton<Repository>(
        () => Repositoryimpl(instance(), instance()));

    /* instance.registerLazySingleton<SeanceRemoteDataSource>(
        () => SeanceRemoteDataSource(dio: Dio()));



    instance.registerLazySingleton<SeanceRepository>(
        () => SeanceRepositoryImpl(remoteDataSource: instance()));*/
  }
}

void initLoginModule() {
  print("aya wink aa");
  // Check if loginUseCase is already registered
  if (!GetIt.I.isRegistered<loginUseCase>()) {
    // Register Repository before loginUseCase
    initAppModule();
    initSignupModule();
    initSeanceTeacher();
    initPresenceSheet();
    initMarks();
    // Create instances of TextEditingController
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // Register loginUseCase and LoginCubit with instances of TextEditingController
    instance.registerFactory<loginUseCase>(() => loginUseCase(instance()));
    instance.registerFactory<LoginCubit>(() => LoginCubit(
          instance(),
          emailController,
          passwordController,
        ));

    instance.registerLazySingleton<SeanceRemoteDataSource>(
        () => SeanceRemoteDataSource(dio: Dio()));

    instance.registerLazySingleton<SeanceRepository>(
        () => SeanceRepositoryImpl(remoteDataSource: instance()));

    instance.registerLazySingleton<PresenceSheetData>(
        () => PresenceSheetData(dio: Dio()));

    instance.registerLazySingleton<PresenceSheetRepo>(
        () => PresenceSheetImpl(presencesheet: instance()));
    instance
        .registerLazySingleton<MarksRequest>(() => MarksRequest(dio: Dio()));

    instance.registerLazySingleton<MarksRepo>(
        () => MarksRepositoryImpl(marksRequest: instance()));
  } else {
    print("injection :c la hachwa");
  }
}

void initSignupModule() {
  print("aya wink aa signup init 2");
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController tdController = TextEditingController();
  instance.registerFactory<SignupCubit>(() => SignupCubit(instance(),
      emailController, passwordController, nameController, tdController));
  instance.registerFactory<SignupUseCase>(() => SignupUseCase(instance()));
}

void initSeanceTeacher() {
  instance.registerFactory<SeanceUseCase>(() => SeanceUseCase(instance()));
  instance.registerFactory<ScheduleCubit>(() => ScheduleCubit(instance()));
}

void initPresenceSheet() {
  instance.registerFactory<PresenceSheetUseCase>(
      () => PresenceSheetUseCase(instance()));
  instance.registerFactory<PresenceSheetCubit>(
      () => PresenceSheetCubit(instance()));
}

void initMarks() {
  instance.registerFactory<MarksUseCase>(() => MarksUseCase(instance()));
  instance.registerFactory<MarksCubit>(() => MarksCubit(instance()));
}
