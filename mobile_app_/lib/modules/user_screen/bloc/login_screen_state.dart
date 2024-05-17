





part of 'login_screen_bloc.dart';




abstract class LoginScreenState {}

class LoginScreenInitial extends LoginScreenState {}

// состояние в котором нужно показать форму входа
class LoginState extends LoginScreenState {
  bool hasError;
  LoginState({this.hasError = false});
}

// состояние в котором нужно показать личный кабинет
class AccountState extends LoginScreenState {
  User user;
  AccountState({required this.user});
}