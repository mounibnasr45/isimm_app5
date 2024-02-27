import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/data_source/remote_data_source/auth.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';

class AuthRepoImpl implements AuthRepository {
  final Authentication auth;

  AuthRepoImpl({required this.auth});

  @override
  Future<Either<Failure, List<StudentData>>> signup(List<StudentData> s) {
    return auth.signup(s);
  }

  @override
  Future<Either<Failure, StudentData>> login(Map<String, String> loginmap) {
    return auth.login(loginmap);
  }
}
