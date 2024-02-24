// SeanceRepositoryImpl.dart

import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/seance.dart';

import '../../domain/repository/teacherScheduleRepo.dart';
import '../data_source/remote_data_source/TeacherSchedule.dart';

class SeanceRepositoryImpl implements SeanceRepository {
  final SeanceRemoteDataSource remoteDataSource;

  SeanceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<SeanceData>>> findSeancesByTeacherId(
      int teacherId,int newday) {
    return remoteDataSource.findSeancesByTeacherId(teacherId,newday);
  }
}
