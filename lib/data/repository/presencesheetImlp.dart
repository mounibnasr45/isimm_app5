import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/presencesheet.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/repository/presencesheetRepo.dart';

class PresenceSheetImpl implements PresenceSheetRepo {
  final PresenceSheetData presencesheet;

  PresenceSheetImpl({required this.presencesheet});

  @override
  Future<Either<Failure, List<StudentData>>> findStudentByTd1(String tdName,int subject_id) {
    return presencesheet.findStudentByTd(tdName,subject_id);
  }
}
