import 'package:dartz/dartz.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';

import 'baseusecase.dart';

class SignupUseCaseInput {
  final String name;
  final String td;
  final String email;
  final String password;
  SignupUseCaseInput({required this.name,required this.td, required this.email, required this.password});
}

class SignupUseCase implements BaseUseCase<SignupUseCaseInput, void> {
  SignupUseCase(this._repo);
 final Repository _repo;

  @override
  Future<Either<Failure,void>> execute(SignupUseCaseInput i) async{
    return await _repo.signup(i.email, i.password,i.name,i.td);

  }
}