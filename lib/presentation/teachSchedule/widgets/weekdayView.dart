import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';

import '../../../core/utils/routes_manager.dart';
import '../../../data/models/seance.dart';
import '../../../domain/entities/models.dart';
import '../view/TaecherSchedule.dart';

class WeekDayView extends StatelessWidget {
  final Color taskCardColor;
  final Color taskTitleColor;
  final Color taskSubtitleColor;
  final List<SeanceData> SeanceList;

  WeekDayView({
    required this.taskCardColor,
    required this.taskTitleColor,
    required this.taskSubtitleColor,
    required this.SeanceList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView.builder(
          itemCount: SeanceList.length,
          itemBuilder: (context, index) {
            SeanceData currentSeance = SeanceList[index];
            print("currentSeance ${currentSeance.subjectName}");
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  //print("current subj ${currentSeance.subjectName}");
                  Navigator.of(context).pushNamed(Routes.presentsheet,
                      arguments: currentSeance.subjectName);
                },
                child: Card(
                  elevation: 10,
                  child: ListTile(
                      title: Text(currentSeance.subjectName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w700)),
                      subtitle: Text((currentSeance.sectionName).toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700)),
                      trailing: Text(
                          currentSeance.Day_time +
                              "       " +
                              (currentSeance.classroomId).toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700)),
                      leading: IconButton(
                          onPressed: () {
                            print("current subj ${currentSeance.subjectName}");
                           Navigator.of(context).pushNamed(Routes.presentsheet,
                      arguments: currentSeance.subjectName);
                          },
                          icon: Icon(
                            Icons.check_box,
                            size: 20,
                          ))),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
