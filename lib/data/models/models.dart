import 'package:json_annotation/json_annotation.dart';
//import 'package:firebase_auth/firebase_auth.dart' as firebase show DataUser ;
part 'models.g.dart';

@JsonSerializable()
class DataUser  {
  const DataUser ({
    required this.username,
    required this.email,
    required this.profileUrl,
  });

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'profileUrl')
  final String profileUrl;

  factory DataUser.fromJson(Map<String, dynamic> json) => _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);
}
