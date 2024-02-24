
import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/marksData.dart';

abstract class MarksRepo {
  Future<Either<Failure, List<MarksData>>> findmarksbystudent(int  id_student);
}