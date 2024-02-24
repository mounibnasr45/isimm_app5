import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:isimm_app5/core/utils/routes_manager.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
    this.withprofile = true,
  });
  final bool withprofile;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: Checkbox.width,
      shadowColor: const Color.fromARGB(142, 232, 231, 231),
      //toolbarHeight: 72.0,
backgroundColor: ColorManager.backgroundColor,
      title: Container(  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text("ISI",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            fontFamily: "DM_Serif_Display",
                            color: Color.fromARGB(255, 3, 41, 72))),
                    Text("MM",
                        style: TextStyle(
                            fontSize: 38,
                            fontFamily: "DM_Serif_Display",
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 115, 3, 3))),
                  ]),
            ),
            Container(
              height: 50,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Higher Institute of Informatics\n and Mathematics of Monastir",
                  style: TextStyle(
                      fontSize: 9,
                      //fontFamily: "DM_Serif_Display",
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 41, 72)),
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.profile);
          },
          child: Container(
            margin: EdgeInsets.only(right: 20, top: 7,bottom: 3),
            //height: 70,
            //width: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/professor_img.jpeg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        )
      ],
    );
  }
}
