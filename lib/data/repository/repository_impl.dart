
/*import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isimm_app5/core/failure/failure.dart';
import 'package:isimm_app5/domain/repository/Authrepository.dart';

import '../../core/failure/error_handler.dart';
import '../../core/network_info/network_info.dart';
import '../data_source/remote_data_source/firebaseAuth.dart';

class Repositoryimpl implements Repository {
  final FirebaseAuthentication _auth;
  final NetworkInfo _network;
  Repositoryimpl(this._auth, this._network);
  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    if (await _network.isConnected) {
      print("_network.isConnected");
      try {
        print("from repo_impl email:" + email);
        var response = await _auth.singInUser(email: email, password: password);
        print("response: $response");
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        print("femma auth exception");
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(Failure(failureMessage: "No internet connection ye hajj"));
    }
  }
  
  @override
  Future<Either<Failure, void>> signup(String email, String password, String name1, String td1) async{
     if (await _network.isConnected) {
      print("_network.isConnected");
      try {
        
        var response = await _auth.registerUser(email: email, password: password,name: name1,td:td1);
        print("response: $response");
        return const Right(null);
      } on FirebaseAuthException catch (e) {
        print("femma auth exception");
        return Left(ErrorHandler.handle(e));
      }
    } else {
      return Left(Failure(failureMessage: "No internet connection ye hajj"));
    }
  }
}
*/