// Import des packages nécessaires
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isimm_app5/core/utils/color_manager.dart';
import 'package:time_planner/time_planner.dart';

class StudentScedule extends StatefulWidget {
  const StudentScedule({
    Key? key,
  }) : super(key: key);

  @override
  _StudentSceduleState createState() => _StudentSceduleState();
}

class _StudentSceduleState extends State<StudentScedule> {
  List<TimePlannerTask> tasks = [];
  late double _scale = 1.0;
  int hours = 1;
  void _generateRandomSessions() {
    // Liste des matières
    List<String> subjects = [
      'ML',
      'Algorithms',
      'Deep Learning',
      'Anglais',
      'c++',
      'java',
      'oop',
    ];

    // Nombre total d'heures par semaine
    int totalHours = 20;

    // Générer aléatoirement des séances pour chaque matière
    while (totalHours - hours >= 0) {
      subjects.forEach((subject) {
        int salle = Random().nextInt(20);
        // Random().nextInt(4) +1; // Choisissez un nombre aléatoire d'heures entre 1 et 4

        tasks.add(
          TimePlannerTask(
            color: ColorManager
                .primary, // Couleur aléatoire (vous pouvez ajuster cela selon vos préférences)
            dateTime: TimePlannerDateTime(
              day: Random().nextInt(7), // Jour aléatoire de la semaine
              hour: Random().nextInt(10) + 8, // Heure aléatoire entre 6 et 23
              minutes: 0, // Minutes aléatoires
            ),
            minutesDuration: hours * 60, // Convertir les heures en minutes
            daysDuration: 1, // Chaque séance dure 1 jour
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  subject,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Tch.name',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'A${salle}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
        totalHours -= hours; // Mettez à jour le nombre total d'heures restantes
      });
    }

    // Mettez à jour l'interface utilisateur
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _generateRandomSessions(); // Générez les séances aléatoires au lancement de l'application
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorManager.backgroundColor,
          //toolbarHeight: 90.0,
          title: Text("Schedule Screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Groupe TD:ING1_INFO_TD2 ",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "From 15/02/2024 ",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Color.fromARGB(255, 175, 11, 11)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onScaleStart: (details) {
                      _scale = 1.0;
                    },
                    onScaleUpdate: (details) {
                      setState(() {
                        _scale = details.scale;
                      });
                    },
                    onScaleEnd: (details) {
                      // Handle any cleanup after scaling ends
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: TimePlanner(
                        startHour: 8,
                        endHour: 14,
                        use24HourFormat: true,
                        setTimeOnAxis: false,
                        style: TimePlannerStyle(
                          showScrollBar: true,
                          interstitialEvenColor: Colors.grey[50],
                          interstitialOddColor: Colors.grey[200],
                        ),
                        headers: const [
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "monday",
                          ),
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "tuesday",
                          ),
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "thursday",
                          ),
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "wednesday",
                          ),
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "friday",
                          ),
                          TimePlannerTitle(
                            date: "3/11/2023",
                            title: "saturday",
                          ),

                          // ... Ajoutez d'autres jours ici
                        ],
                        tasks: tasks,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
