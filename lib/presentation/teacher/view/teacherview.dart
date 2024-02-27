import 'package:flutter/material.dart';

import '../../../core/utils/color_manager.dart';
import '../../../core/utils/routes_manager.dart';
import '../widgets/firstImage.dart';
import '../widgets/serviceitel.dart';
import '../widgets/textintro.dart';

class TeacherView extends StatelessWidget {
  TeacherView({super.key});
  List services = [
    [
      Icons.schedule,
      "Schedule",
    ],
    [
      Icons.bookmark_outlined,
      "Add Courses",
    ],
    [
      Icons.newspaper,
      "Send News",
    ],
    [
      Icons.newspaper,
      "Send Marks",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FirstImage(),
            const TextIntro(),
            Container(
              padding: EdgeInsets.all(15),
              //height: double.infinity,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: services.length,
                itemBuilder: (BuildContext context, int index) {
                  String route = 'teacher' + services[index][1];
                  return ServiceItem(
                      name: services[index][1],
                      icon: services[index][0],
                      onPressed: () {
                        if (services[index][1] == "Add Courses")
                          Navigator.of(context).pushNamed(Routes.chapterRoute);
                        if (services[index][1] == "Schedule")
                          Navigator.of(context)
                              .pushNamed(Routes.teacherSchedule);
                        if (services[index][1] == "Send News")
                          Navigator.of(context).pushNamed(Routes.sendnews);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
