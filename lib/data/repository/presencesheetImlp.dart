import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/presencesheet.dart';
import 'package:isimm_app5/data/data_source/studentAbsent.dart';



import 'package:isimm_app5/domain/repository/presencesheetRepo.dart';

class PresenceSheetImpl implements PresenceSheetRepo {
  final PresenceSheetData presencesheet=PresenceSheetData();

  PresenceSheetImpl();

  @override
  Future<Either<Failure, List<studentAbs>>> findStudentByTd1(
      String tdName, int subject_id) {
    return presencesheet.findStudentByTd(tdName, subject_id);
  }
}
