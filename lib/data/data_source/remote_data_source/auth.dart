import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/marksData.dart';
import 'package:isimm_app5/data/models/studentdata.dart';

import '../../../core/failure/error_handler.dart';

class Authentication {
  final Dio dio;

  Authentication({required this.dio});

Future<Either<Failure, List<StudentData>>> signup(List<StudentData> students) async {
  try {
    final response = await dio.post(
      'http://192.168.1.16:8080/student/save',
      data: students.map((student) => student.toJson()).toList(),
    );

    final List<dynamic> responseData = response.data;

    final List<StudentData> studentResponses = responseData
        .map((jsonList) => StudentData.fromJson(jsonList))
        .toList();

    return Right(studentResponses);
  } catch (e) {
    print(e);
    return Left(ErrorHandler.handle(e));
  }
}
Future<Either<Failure, StudentData>> login(Map<String, String> loginmap) async {
  try {
    final response = await dio.post(
      'http://192.168.1.16:8080/student/login',
      data: loginmap,
    );

    final Map<String, dynamic> responseData = response.data;

    final StudentData studentResponse = StudentData.fromJson(responseData);

    return Right(studentResponse);
  } catch (e) {
    print(e);
    return Left(ErrorHandler.handle(e));
  }
}
}
