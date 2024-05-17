

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

import 'package:mobile_app_/modules/user_screen/bloc/login_screen_bloc.dart';
import '../../../repositories/user_repository/user_repository.dart';

import 'login_form.dart';
import 'account_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginScreenBloc = LoginScreenBloc(GetIt.I<UserRepository>());

  @override
  void initState() {
    // добавляем event проверки авторизации
    _loginScreenBloc.add(LoginCheck());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);

    return Scaffold(
      body:
        // Root контейнер
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child:

          Column(
            children: [

              HardBackArrow(),

              BlocBuilder<LoginScreenBloc, LoginScreenState>(
                bloc: _loginScreenBloc,
                builder: (context, state) {

                  // пользователь не зарегестрирован
                  if (state is LoginState) {
                    return LoginForm(loginScreenBloc: _loginScreenBloc);
                  }

                  if (state is AccountState) {
                    return AccountPage(user: (state as AccountState).user, loginScreenBloc: _loginScreenBloc);
                  }

                  return const Text("_loginScreenBloc error");

                }
              )
              
            ],
          ),
        )
    );
  }
}
