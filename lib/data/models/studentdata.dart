class StudentData {
  final int? student_id;
  String nom;
  int? id_section;
  int nbAbsent;
  StudentData({
    this.id_section,
    required this.nom,
    required this.nbAbsent,
    this.student_id,
  });
  factory StudentData.fromJson(List<dynamic> json) =>
      _$StudentDataFromJson(json);
}

StudentData _$StudentDataFromJson(List<dynamic> json) {
  return StudentData(
    student_id: json[0] as int,
    nom: json[1] as String,
    id_section: json[2] as int,
    nbAbsent: json[3] as int,
  );
}
