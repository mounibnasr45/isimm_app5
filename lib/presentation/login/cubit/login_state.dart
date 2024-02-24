import 'package:equatable/equatable.dart';

//part of 'login_cubit.dart';
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {}
class EmailIsEmpty extends LoginState{}
class PasswordIsEmpty extends LoginState{}

class TextFieldEmpty extends LoginState {
  final String status;
  final bool isempty;
  const TextFieldEmpty({required this.status,required this.isempty});
}

class LoginError extends LoginState {
  final String message;

  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}

class Is_Login extends LoginState {}

class Is_Signup extends LoginState {}
