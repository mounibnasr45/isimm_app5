import 'package:dartz/dartz.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import '../../core/failure/failure.dart';

/*abstract class Repository {
  Future<Either<Failure, StudentData>> login(Map<String, String> loginmap);
  Future<Either<Failure, void>> signup(
      String email, String password, String name, String td);
}*/

abstract class AuthRepository {
  Future<Either<Failure, List<StudentData>>> signup(List<StudentData> s);
    Future<Either<Failure, StudentData>> login(Map<String, String> loginmap);

}
