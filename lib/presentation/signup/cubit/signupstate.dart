import 'package:equatable/equatable.dart';
import 'package:isimm_app5/presentation/login/cubit/login_state.dart';
//part of 'signupcubit.dart';
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupLoaded extends SignupState {}

class TextFieldEmpty extends SignupState {
  final String status; 

  const TextFieldEmpty({required this.status});
}
class EmailIsEmpty extends SignupState{}
class NameIsEmpty extends SignupState{}
class PasswordIsEmpty extends SignupState{}
class ShortPassword extends SignupState{}
class SignupError extends SignupState {
   final String message;

  const SignupError({required this.message});
  @override
  List<Object> get props => [message];
}

class Is_Login extends SignupState{
}
class Is_Signup extends SignupState{
}