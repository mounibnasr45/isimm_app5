import 'package:flutter/material.dart';

import '../../../core/utils/routes_manager.dart';

class MyAppBarprofile extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, Routes.homeRoute),
      ),
      automaticallyImplyLeading: false,
      title: Text("Profil "),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
