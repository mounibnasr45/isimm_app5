import 'package:get/get.dart';

import '../../core/utils/strings_manager.dart';

class User {
  final String username;
  final String email;
  final String profileUrl;
  final String td;
  const User(
      {required this.username,
      required this.email,
      required this.profileUrl,
      required this.td});
}

class seance {
  String matiere, td, salle_heure;
  seance({required this.matiere, required this.salle_heure, required this.td});
}

class Seance {
  final String subjectName;
  final int classroomId;
  final String teacherName;
  final int sectionId;

  Seance({
    required this.subjectName,
    required this.classroomId,
    required this.teacherName,
    required this.sectionId,
  });
}
