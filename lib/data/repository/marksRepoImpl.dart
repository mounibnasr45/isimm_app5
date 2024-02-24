
import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/marksRequest.dart';
import 'package:isimm_app5/data/models/marksData.dart';
import 'package:isimm_app5/domain/repository/marksRepo.dart';

class MarksRepositoryImpl implements MarksRepo {
  final MarksRequest marksRequest;

  MarksRepositoryImpl({required this.marksRequest});

  @override
  Future<Either<Failure, List<MarksData>>> findmarksbystudent(
      int id_student) {
    return marksRequest.findMarksByStudent(id_student);
  }
}