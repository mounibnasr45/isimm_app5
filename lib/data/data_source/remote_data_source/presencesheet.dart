import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/presentation/shared/shared_functions.dart';
import '../../../core/failure/error_handler.dart';
import '../../models/studentdata.dart';

class PresenceSheetData {
  final Dio dio;

  PresenceSheetData({required this.dio});

  Future<Either<Failure, List<StudentData>>> findStudentByTd(
      String tdName,int subject_id) async {
    int tdid = TdToInt(tdName);
    try {
      final response =
          await dio.get('http://192.168.1.16:8080/student/getclass/$tdid/$subject_id');

      final List<dynamic> responseData = response.data;

      final List<StudentData> students = responseData
          .map((jsonList) => StudentData.fromJson(jsonList))
          .toList();

      return Right(students);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }

  Future<Either<Failure, int>> addAbsent(int id_student,int subj_id) async {
    try {
      final response =
          await dio.post('http://localhost:8080/marks/addabsent/$id_student/$subj_id');

      final int responseData = response.data;

      return Right(responseData);
    } catch (e) {
      if (e is DioException) {
        // Handle DioError specifically
        print("DioError: ${e.message}");
        return Left(ErrorHandler.handle(e));
      } else {
        print(e);
        return Left(ErrorHandler.handle(e));
      }
    }
  }
}
