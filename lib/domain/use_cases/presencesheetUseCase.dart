import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/repository/presencesheetRepo.dart';

class PresenceSheetUseCase {
  PresenceSheetUseCase(this._presenceRepo);
  final PresenceSheetRepo _presenceRepo;

  Future<Either<Failure, List<StudentData>>> execute(String tdname,int subject_id) async {
    return await _presenceRepo.findStudentByTd1(tdname,subject_id);
  }
}