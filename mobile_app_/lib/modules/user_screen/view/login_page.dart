




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

import 'package:mobile_app_/modules/user_screen/bloc/login_screen_bloc.dart';
import '../../../repositories/user_repository/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final loginConroller = TextEditingController();
  final passwordConroller = TextEditingController();

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
                    return Column(
                      children: [
                        // Главный заголовок
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Text("Войти в аккаунт",
                            style: thm.textTheme.bodyLarge,
                          ),
                        ),

                        // линия после поле логина
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                            right: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child:  const Divider(
                            height: 1, // высота линии
                            thickness: 2.0, // толщина линии
                            color: Color.fromRGBO(110, 110, 110, 0.478), // цвет линии
                          ),
                        ),

                        // Заголовок логин
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: const Text('Login',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 17,
                              color: Color.fromRGBO(79, 79, 79, 0.78),
                            ),
                          ),
                        ),

                        // Поле Login
                        Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: TextField(
                              controller: loginConroller,
                              onChanged: (var value) {
                                loginConroller.text = value;
                              },
                              decoration: InputDecoration(
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: " введите login",
                              ),
                              style: thm.textTheme.displayMedium,
                              minLines: 1,
                              maxLines: 1,
                            )
                        ),

                        // Заголовок пароля
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: const Text('Password',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 17,
                              color: Color.fromRGBO(79, 79, 79, 0.78),
                            ),
                          ),
                        ),

                        // Поле Password
                        Container(
                            margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: TextField(
                              controller: passwordConroller,
                              onChanged: (var value) {
                                passwordConroller.text = value;
                              },
                              decoration: InputDecoration(
                                border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: " введите password",
                              ),
                              style: thm.textTheme.displayMedium,
                              minLines: 1,
                              maxLines: 1,
                            )
                        ),

                        // подсказка к паролю
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Login: amogus",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Color.fromRGBO(79, 79, 79, 0.78),
                                    )
                                ),
                                Text(
                                    "Password: qwerty123",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 17,
                                      color: Color.fromRGBO(79, 79, 79, 0.78),
                                    )
                                )
                              ],
                            )
                        ),

                        // кнопка 'войти'
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO добавить обработку текста ввохода
                              print("${loginConroller.text} ${passwordConroller.text}");
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromRGBO(35, 79, 104, 1)
                                )
                            ),
                            child: const Text(
                                "Войти",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat"
                                )
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                  return Text("_loginScreenBloc error");

                }
              )



            ],
          ),
        )
    );
  }
}
