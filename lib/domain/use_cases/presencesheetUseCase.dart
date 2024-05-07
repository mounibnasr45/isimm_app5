import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/studentAbsent.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/data/repository/presencesheetImlp.dart';
import 'package:isimm_app5/domain/repository/presencesheetRepo.dart';

class PresenceSheetUseCase {
  PresenceSheetUseCase();
  final PresenceSheetRepo _presenceRepo=PresenceSheetImpl();

  Future<Either<Failure, List<studentAbs>>> execute(String tdname,int subject_id) async {
    return await _presenceRepo.findStudentByTd1(tdname,subject_id);
  }
}