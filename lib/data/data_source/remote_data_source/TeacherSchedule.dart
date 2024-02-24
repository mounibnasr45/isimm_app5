// SeanceRemoteDataSource.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isimm_app5/core/failure/error_handler.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/seance.dart';

class SeanceRemoteDataSource {
  final Dio dio;

  SeanceRemoteDataSource({required this.dio});

  Future<Either<Failure, List<SeanceData>>> findSeancesByTeacherId(
      int teacherId,int newday) async {
    try {
      final response =
          await dio.get('http://http://192.168.1.16:8080/seance/teacher/$teacherId/$newday');
     // print("heeeeeeeeeeeey $response");
      final List<dynamic> responseData = response.data; // Modified this line
     // print("cccc $responseData");

      final List<SeanceData> seances = responseData
          .map((jsonList) => SeanceData.fromJson(jsonList))
          .toList();

      return Right(seances);
    } catch (e) {
      print(e);
      return Left(ErrorHandler.handle(e));
    }
  }
}
