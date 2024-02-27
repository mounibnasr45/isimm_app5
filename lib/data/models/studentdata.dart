class StudentData {
  final int? student_id;
  String nom;
  String email;
  String password;
  int? id_section;

  StudentData({
    required this.id_section,
    required this.nom,
    required this.student_id,
    required this.email,
    required this.password,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) =>
      _$StudentDataFromJson(json);

  Map<String, dynamic> toJson() => _$StudentDataToJson(this);
}

StudentData _$StudentDataFromJson(Map<String, dynamic> json) {
  return StudentData(
    email: json["email"] as String,
    nom: json["name"] as String,
    password: json["password"] as String,
    id_section: json["section"]["section_id"] as int,
    student_id: json["student_id"] as int,
  );
}

Map<String, dynamic> _$StudentDataToJson(StudentData instance) => {
  'student_id': instance.student_id,
  'name': instance.nom,
  'email': instance.email,
  'password': instance.password,
  'section': {
    'section_id': instance.id_section,
  },
};