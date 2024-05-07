class studentAbs {
  final int student_id;
  String nom;
  int id_section;
  int nb_absent;
 

  studentAbs({
    required this.id_section,
    required this.nom,
    required this.student_id,
    required this.nb_absent,
  });

  factory studentAbs.fromJson(List<dynamic> json) =>
      _$studentAbsFromJson(json);

  //Map<String, dynamic> toJson() => _$studentAbsToJson(this);
}

studentAbs _$studentAbsFromJson(List<dynamic> json) {
  return studentAbs(
    nom: json[1] as String,
    student_id: json[0] as int,
    id_section: json[2] as int,
    nb_absent: json[3] as int,
  );
}

// Map<String, dynamic> _$studentAbsToJson(studentAbs instance) => {
//   'student_id': instance.student_id,
//   'name': instance.nom,
//   'email': instance.email,
//   'password': instance.password,
//   'section': {
//     'section_id': instance.id_section,
//   },
// };