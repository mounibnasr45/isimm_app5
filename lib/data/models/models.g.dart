// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      username: json['username'] as String,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
    };
