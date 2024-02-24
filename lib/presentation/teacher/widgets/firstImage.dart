import 'package:flutter/material.dart';

class FirstImage extends StatelessWidget {
  const FirstImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      child: Image.asset(
        'assets/images/teacherimg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
