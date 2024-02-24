import 'package:flutter/material.dart';

class List_modules extends StatelessWidget {
   List_modules({super.key,required this.modules_list});
  final List<String> modules_list;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, idx) {
          return Container(
            margin: EdgeInsets.only(top: 10, right: 20),
            width: 80,
            child: Column(children: [
              Icon(
                Icons.book,
                size: 44,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                modules_list[idx],
                style: TextStyle(color: Colors.white),
              )
            ]),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: modules_list.length,
      ),
    );
  }
}
