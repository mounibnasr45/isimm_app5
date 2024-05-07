import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/studentAbsent.dart';


abstract class PresenceSheetRepo {
  Future<Either<Failure, List<studentAbs>>> findStudentByTd1(String tdName,int subject_id);
}
