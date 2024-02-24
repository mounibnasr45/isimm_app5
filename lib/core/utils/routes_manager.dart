import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/injector.dart';
import 'package:isimm_app5/presentation/login/view/loginview.dart';
import 'package:isimm_app5/presentation/marks/view/studentmarksView.dart';
import 'package:isimm_app5/presentation/presences_heet/cubit/presence_cubit.dart';
import 'package:isimm_app5/presentation/profile/view/profileview.dart';
import 'package:isimm_app5/presentation/sendnews/news/news.dart';
import 'package:isimm_app5/presentation/signup/view/signupview.dart';
import 'package:isimm_app5/presentation/studentCourses.dart/pages/chaptreview.dart';

import '../../presentation/homescreen/view/homescreen.dart';
import '../../presentation/presences_heet/view/presence_sheet.dart';
import '../../presentation/teachSchedule/view/TaecherSchedule.dart';

class Routes {
  static const String signup = "/signup";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String chapterRoute = "/chaptre";
  static const String studentSchedule = "/schedule";
  static const String classRoute = "/class";
  static const String student = "/student";
  static const String teacherSchedule = "/schedule_teach";
  static const String teachView = "/teachView";
  static const String profile = "/profile";
  static const String presentsheet = "/presentsheet";
  static const String teachernews = "/teachernews";
  static const String marks = "/marks";
  static const String sendnews = "/sendnews";
  /*static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";*/
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) =>  SignupView());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => Profile());
     case Routes.teacherSchedule:
       return MaterialPageRoute(builder: (_) => TaecherSchedule());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
     case Routes.presentsheet:
  return MaterialPageRoute(
    builder: (context) {
      // Récupérer les arguments s'il y en a
      final String? subjectName = settings.arguments as String?;

      // Utiliser le sujet (subjectName) dans la construction de la page
      return BlocProvider(
        create: (context) => instance<PresenceSheetCubit>(),
        child: PresenceSheet(subjectName: subjectName ?? 'Default Subject'));
    },
  );


      case Routes.marks:
        return MaterialPageRoute(builder: (_) => Marks());
      case Routes.chapterRoute:
        return MaterialPageRoute(
            builder: (_) => ChapterPage());
      case Routes.sendnews:
        return MaterialPageRoute(
            builder: (_) => News("1"));
     /* case Routes.teachView:
        return MaterialPageRoute(builder: (_) => TeacherView());
      case Routes.student:
        return MaterialPageRoute(builder: (_) => const StudentLife());
      // case Routes.chapterRoute:
      //   return MaterialPageRoute(builder: (_) => Chapter(id: 'algo',));

      case Routes.studentSchedule:
        return MaterialPageRoute(builder: (_) => ScheduleView());
      // case Routes.classRoute:
      //   return MaterialPageRoute(builder: (_) => const ClassAbsent());
      /*case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      */*/
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("fiq ala wadheaak"),
              ),
              body: const Center(child: Text("noRouteFound")),
            ));
  }
}
