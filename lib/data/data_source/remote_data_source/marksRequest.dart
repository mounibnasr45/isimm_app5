import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/marksData.dart';
import 'package:isimm_app5/presentation/shared/shared_functions.dart';
import '../../../core/failure/error_handler.dart';
import '../../models/studentdata.dart';

class MarksRequest {
  final Dio dio;

  MarksRequest({required this.dio});

  Future<Either<Failure, List<MarksData>>> findMarksByStudent(
      int id_student) async {
    
    try {
      final response =
          await dio.get('http://192.168.1.16:8080/marks/getmark/$id_student');

      final List<dynamic> responseData = response.data;

      final List<MarksData> marks = responseData
          .map((jsonList) => MarksData.fromJson(jsonList))
          .toList();

      return Right(marks);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }
}
