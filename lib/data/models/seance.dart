import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SeanceData {
  final String subjectName;
  final String classroomId;
  final String teacherName;
  final String sectionName;
  final String Day_time;

  SeanceData({
    required this.subjectName,
    required this.classroomId,
    required this.teacherName,
    required this.sectionName,
    required this.Day_time,
  });
  @override
  String toString() {
    return 'Seance{subjectName: $subjectName, classroomId: $classroomId, teacherName: $teacherName, sectionId: $sectionName}';
  }

  factory SeanceData.fromJson(List<dynamic> json) => _$SeanceFromJson(json);

  // List<dynamic> toJson() => _$SeanceToJson(this);
}

SeanceData _$SeanceFromJson(List<dynamic> json) {
  return SeanceData(
    subjectName: json[0] as String,
    classroomId: "A"+json[1].toString() as String,
    teacherName: json[2] as String,
    sectionName: json[3] as String,
    Day_time: json[4] as String,
  );
}
/*
Map<String, dynamic> _$SeanceToJson(Seance instance) => <String, dynamic>{
      'subjectName': instance.subjectName,
      'classroomId': instance.classroomId,
      'teacherName': instance.teacherName,
      'sectionId': instance.sectionId,
    };
*/