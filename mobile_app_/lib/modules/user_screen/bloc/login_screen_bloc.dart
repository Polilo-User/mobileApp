


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/repositories/user_repository/user_repository.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {

  final UserRepository userRepository;
  LoginScreenBloc(this.userRepository) : super(LoginScreenInitial()) {

    // проверка на состояние входа в аккаунт
    on<LoginCheck>( (event, emit) async {

      // если пользователь залогинен -> переходимуем в личный кабинет
      // if
      // emit

      // если пользователь не залогинен -> показываем форму входа
      // else

      emit(LoginState());
    });

    // войти в аккаунт
    on<LoginToAccount>( (event, emit) async {

      var responce = await userRepository.userAuth(login: event.login, password: event.password);

      // проверка на ошибку логина/пароля
      if (responce is bool) {
        if (responce == false) {
          emit(LoginState(hasError: true));
        }
      }


    });

  }
}