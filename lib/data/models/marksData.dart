import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MarksData {
  final String subjectName;
  final int tp;
  final int ds;
  final int exam;

  MarksData({
    required this.subjectName,
    required this.tp,
    required this.ds,
    required this.exam,
  });
  @override
  String toString() {
    return 'Seance{subjectName: $subjectName, tp: $tp, ds:$ds ,exam:$exam}';
  }

  factory MarksData.fromJson(List<dynamic> json) => _$MarksDataFromJson(json);

  // List<dynamic> toJson() => _$MarksDataToJson(this);
}

MarksData _$MarksDataFromJson(List<dynamic> json) {
  return MarksData(
    tp: json[0] as int,
    ds: json[1] as int,
    exam: json[2] as int,
    subjectName: json[3] as String,
    
  );
}
/*
Map<String, dynamic> _$MarksDataToJson(MarksData instance) => <String, dynamic>{
      'subjectName': instance.subjectName,
      'classroomId': instance.classroomId,
      'teacherName': instance.teacherName,
      'sectionId': instance.sectionId,
    };
*/