import 'package:flutter/material.dart';

class ModuleItem extends StatelessWidget {
  const ModuleItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        //color: Colors.white,
        width: 100,
        height: 107,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(top: 7, bottom: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 255, 255)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Icon(
                icon,
                size: 44,
                color: Colors.blue,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}