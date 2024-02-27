import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  ServiceItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });
  final String name;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Color.fromARGB(255, 151, 151, 151),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              icon,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
