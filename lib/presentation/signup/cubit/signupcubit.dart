import 'dart:js';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isimm_app5/data/models/studentdata.dart';
import 'package:isimm_app5/domain/use_cases/signupusecase.dart';
import 'package:isimm_app5/presentation/shared/shared_functions.dart';

import '../../../core/failure/failure.dart';
import '../../login/cubit/login_cubit.dart';
import 'signupstate.dart';

class SignupCubit extends Cubit<SignupState> implements AuthCubit {
  SignupCubit(this._SignupUseCase, this._emailController,
      this._passwordController, this._nameController, this._tdController)
      : super(SignupInitial()) {
    initializeControllers();
  }
  List<bool> flag = [
    true,
    true,
    true,
  ];
  String selectTd = "CPI1";
  final SignupUseCase _SignupUseCase;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _nameController;
  final TextEditingController _tdController;
  bool isLogin = false;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get nameController => _nameController;
  TextEditingController get tdController => _tdController;
  void initializeControllers() {
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    _tdController.clear();
  }

  void loginClicked() {
    isLogin = true;
  }

  void SignupClicked() {
    isLogin = false;
  }

  Future<void> Signup() async {
    emit(SignupInitial());
    print("td selected:$selectTd");
    //List<bool> test = _checkInput();
    //if (!test[0] || !test[1] || !test[2]) return;
    int tdsection = TdToInt(selectTd);
    emit(SignupLoading());
    if (nameController.text.isEmpty) {
      emit(NameIsEmpty());
    } else if (emailController.text.isEmpty) {
      emit(EmailIsEmpty());
    } else if (passwordController.text.isEmpty) {
      emit(PasswordIsEmpty());
    } else if (passwordController.text.length < 8) {
      emit(ShortPassword());
    } else {
      try {
        print("idsection $tdsection");
        List<StudentData> liststudent = [
          StudentData(
              id_section: tdsection,
              nom: nameController.text,
              student_id: null,
              email: emailController.text,
              password: passwordController.text)
        ];
        final Either<Failure, List<StudentData>> result =
            await _SignupUseCase.execute(liststudent);

        if (!isClosed) {
          emit(
            result.fold(
              (failure) => SignupError(message: failure.failureMessage),
              (userCred) => SignupLoaded(),
            ),
          );
        }
      } catch (e) {
        // Gérer les erreurs ici, imprimer ou envoyer à un système de journalisation
        print("Signup failed with error: $e");
        emit(SignupError(message: "An error occurred during signup."));
      }
    }
  }
}
