import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/presentation/login/cubit/login_state.dart';

import '../../../core/failure/failure.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';

abstract class AuthCubit {
  bool get isLogin;
}

class LoginCubit extends Cubit<LoginState> implements AuthCubit {
  LoginCubit(
      this._loginUseCase, this._emailController, this._passwordController)
      : super(LoginInitial()) {
    // Call the initializeControllers method in the constructor
    initializeControllers();
  }

  final loginUseCase _loginUseCase;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  bool isLogin = true;
  int flag = 0;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
// Method to initialize controllers
  void initializeControllers() {
    _emailController.clear();
    _passwordController.clear();
  }

  void loginClicked() {
    isLogin = true;
  }

  void SignupClicked() {
    isLogin = false;
  }

  Future<void> login() async {
    emit(LoginInitial());

    //if (_checkInput() > 0) return;

    emit(LoginLoading());
    if (_emailController.text.isEmpty) {
      emit(EmailIsEmpty());
    } else if (_passwordController.text.isEmpty) {
      emit(PasswordIsEmpty());
    } else {
      try {
        Map<String, String> loginmap = {
          "email": _emailController.text,
          "password": _passwordController.text,
        };
        final Either<Failure, StudentData> result = await _loginUseCase.execute(
          loginmap
        );

        if (!isClosed) {
          emit(result.fold(
            (failure) => LoginError(message: failure.failureMessage),
            (userCred) => LoginLoaded(s: userCred),
          ));
        }
      } catch (e) {
        print("Exception occurred: $e");
        // Handle the exception appropriately
      }
    }
  }
}

class AuthenticationFailure extends Failure {
  final String errorMessage;

  AuthenticationFailure(
      {required super.failureMessage, required this.errorMessage});
}
