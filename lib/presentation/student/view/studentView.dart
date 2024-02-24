import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

import '../../../core/utils/routes_manager.dart';


class StudentLife extends StatelessWidget {
     StudentLife({super.key});

  List Services = [
    [Icons.bookmark_outlined, "Courses", "4 models"],
    [Icons.schedule, "Schedule", "1 model"],
    [Icons.diversity_3_sharp, "Clubs", "4 models"],
    [Icons.maps_home_work_sharp, "Marks", "8 models"],
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstImage(),
          TextIntro(context),
          Container(
            padding: EdgeInsets.all(15),
            //height: double.infinity,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: Services.length,
              itemBuilder: (BuildContext context, int index) {
                return ServiceItem(
                  modeles: Services[index][2],
                  name: Services[index][1],
                  i: Services[index][0],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container TextIntro(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Models - Student life",
                  style: TextStyle(
              fontSize: 26,
              fontFamily: "Noto_Sans",
              fontWeight: FontWeight.bold,
              color: ColorManager.darkPrimary)
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hey UserName,",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              "Maximize your academic potential with Notion's student templates. Easily organize your class notes, homework and projects. Keep track of your grades and goals.",
               style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600,fontSize: 16)
            ),
            SizedBox(
              height: 0,
            ),
          ],
        ));
  }

  Container FirstImage() {
    return Container(
      //height: 100,
      child: Image.asset(
        'assets/images/isimm_taswir.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  ServiceItem(
      {super.key,
      required this.modeles,
      required this.name,
      required this.i,
      required this.index});
  String name, modeles;
  IconData i;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == 0)
          Navigator.of(context).pushNamed(Routes.chapterRoute);
        else if (index == 1)
          Navigator.of(context).pushNamed(Routes.studentSchedule);
        else if (index == 2)
          Navigator.of(context).pushNamed(Routes.chapterRoute);
        else if (index == 3)
          Navigator.of(context).pushNamed(Routes.marks);
      },
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
            if(index==1)
            Image.asset("assets/images/schedule.png",height: 30,width: 30,color: Colors.black,)
            else
            Icon(
              i,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              modeles,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
