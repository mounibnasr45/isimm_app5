import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //toolbarHeight: 90.0,
      title: Container(
        color: Color.fromARGB(255, 187, 185, 185),
        // height: 100,
        // width: double.infinity,
        width: double.infinity,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
            Container(
             
              child: Text("Logo",style: Theme.of(context).textTheme.headlineMedium,)
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "ISIMM",
              style: TextStyle(
                  fontFamily: "RobotoSlab-VariableFont_wght",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            // Profile(
            //   userName: "mounib_nasr",
            //   // height: 70,
            //   // width: 75,
            // ),
          ],
        ),
      ),
    );
  }
}