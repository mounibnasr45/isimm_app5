import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';

import 'baseusecase.dart';

class LoginUseCaseInput {
  final String email;
  final String password;
  LoginUseCaseInput({required this.email, required this.password});
}

class loginUseCase implements BaseUseCase<LoginUseCaseInput, void> {
  loginUseCase(this._repo);
 final Repository _repo;

  @override
  Future<Either<Failure,void>> execute(LoginUseCaseInput i) async{
    return await _repo.login(i.email, i.password);

  }
}
