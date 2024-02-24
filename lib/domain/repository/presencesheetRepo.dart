import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/studentdata.dart';

abstract class PresenceSheetRepo {
  Future<Either<Failure, List<StudentData>>> findStudentByTd1(String tdName,int subject_id);
}
