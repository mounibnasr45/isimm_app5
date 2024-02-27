import 'package:flutter/material.dart';

import '../../../core/utils/valurs_manager.dart';

class logoLogin extends StatelessWidget {
  const logoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding:
        EdgeInsets.symmetric(horizontal: 20, vertical:30),
    child: Image.asset(
      "assets/images/login_logo - Copy.png",
      color: Colors.white,
    ),
  );
  }
}