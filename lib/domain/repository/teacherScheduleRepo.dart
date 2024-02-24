import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';

import '../../data/models/seance.dart';

abstract class SeanceRepository {
  Future<Either<Failure, List<SeanceData>>> findSeancesByTeacherId(
      int teacherId,int newday);
}
