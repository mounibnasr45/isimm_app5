
import 'package:dartz/dartz.dart';
import '../../core/failure/failure.dart';

abstract class Repository {
  Future<Either<Failure, void>> login(String email, String password);
  Future<Either<Failure, void>> signup(String email, String password,String name ,String td);

}
