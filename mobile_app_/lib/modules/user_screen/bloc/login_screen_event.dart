




part of 'login_screen_bloc.dart';




abstract class LoginScreenEvent {}



// экран загружен
class LoginCheck extends LoginScreenEvent {}

// войти в аккаунт
class LoginToAccount extends LoginScreenEvent {
  LoginToAccount({required this.login, required this.password});
  final String login;
  final String password;
}