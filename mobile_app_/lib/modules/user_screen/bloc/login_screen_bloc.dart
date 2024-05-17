


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/repositories/user_repository/user_repository.dart';
import 'package:mobile_app_/repositories/user_repository/models/user.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {

  final UserRepository userRepository;
  LoginScreenBloc(this.userRepository) : super(LoginScreenInitial()) {

    // проверка на состояние входа в аккаунт
    on<LoginCheck>( (event, emit) async {

      User? user = userRepository.getUser();

      if (user == null) {
        // если пользователь не залогинен -> показываем форму входа
        emit(LoginState());
      } else {
        // если пользователь залогинен -> переходимуем в личный кабинет
        emit(AccountState(user: user));
      }
    });

    // войти в аккаунт
    on<LoginToAccount>( (event, emit) async {

      User? user = await userRepository.userAuth(login: event.login, password: event.password);

      // проверка на ошибку логина/пароля
      if (user == null) {
        emit(LoginState(hasError: true));
      } else {
        emit(AccountState(user: user));
      }
    });

    // выйти из аккаунта
    on<Logout>( (event, emit) async {
      await userRepository.logout();
      emit(LoginState());
    });

  }
}