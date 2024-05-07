import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/seance.dart';
import 'package:isimm_app5/data/repository/teacherScheduleRepoImlp.dart';
import 'package:isimm_app5/domain/repository/teacherScheduleRepo.dart';

class SeanceUseCase {
  SeanceUseCase();
  final SeanceRepository _seanceRepo=SeanceRepositoryImpl();

  Future<Either<Failure, List<SeanceData>>> execute(int idteacher,int newday) async {
    return await _seanceRepo.findSeancesByTeacherId(idteacher,newday);
  }
}
