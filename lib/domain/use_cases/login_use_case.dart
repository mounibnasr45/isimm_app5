import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/data/repository/AuthRepoImpl.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';

import 'baseusecase.dart';

class LoginUseCaseInput {
  final String email;
  final String password;
  LoginUseCaseInput({required this.email, required this.password});
}

class loginUseCase{
  loginUseCase(this._repo);
 final AuthRepoImpl _repo;

  @override
  Future<Either<Failure,StudentData>> execute(Map<String, String> loginmap) async{
    return await _repo.login(loginmap);

  }
}
