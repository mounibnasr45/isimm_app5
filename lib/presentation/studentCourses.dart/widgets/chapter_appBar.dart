import 'package:flutter/material.dart';


class chapter_appBar extends StatelessWidget {
  const chapter_appBar({super.key});
  static const primaryColor = Color(0xFF007AFF);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0, // pour retirer la shadow de l'AppBar
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Row(
        children: [
          Container(
            height: 45,
            child: Image.asset("assets/images/raslogo.png"),
          ),
          SizedBox(width: 20),
          const Text(
            "Chapter management",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
