import 'package:dartz/dartz.dart';
import 'package:isimm_app5/data/models/marksData.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/repository/marksRepo.dart';

import '../../core/failure/failure.dart';

class MarksUseCase {
  MarksUseCase(this._marksRepo);
  final MarksRepo _marksRepo;

  Future<Either<Failure, List<MarksData>>> execute(int id_student) async {
    return await _marksRepo.findmarksbystudent(id_student);
  }
}