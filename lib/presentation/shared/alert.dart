import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/routes_manager.dart';
import 'package:isimm_app5/presentation/login/view/loginview.dart';

import '../../core/utils/valurs_manager.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String actionText;
  final bool islogin = true;
  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
           Navigator.of(context).popAndPushNamed(Routes.teacherSchedule); // Close the dialog when the button is pressed
          },
          child: Text(actionText),
        ),
      ],
    );
  }

  // Function to show the dialog
  static void show(
      BuildContext context, String title, String message, String actionText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(
          title: title,
          message: message,
          actionText: actionText,
        );
      },
    );
  }
}
class LoginAlert extends StatelessWidget {
  final String title;
  final String message;
  final String actionText;
  final bool islogin = true;
  const LoginAlert({
    Key? key,
    required this.title,
    required this.message,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );// Close the dialog when the button is pressed
          },
          child: Text(actionText),
        ),
      ],
    );
  }

  // Function to show the dialog
  static void show(
      BuildContext context, String title, String message, String actionText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
           Navigator.of(context).popAndPushNamed(Routes.loginRoute); // Close the dialog when the button is pressed
          },
          child: Text(actionText),
        ),
      ],
    );
      },
    );
  }
}
