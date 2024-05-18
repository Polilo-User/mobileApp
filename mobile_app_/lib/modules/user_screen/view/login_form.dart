

import 'package:flutter/material.dart';

import '../bloc/login_screen_bloc.dart';


class LoginForm extends StatefulWidget {

  LoginForm({super.key, required this.loginScreenBloc, this.hasError = false});

  final LoginScreenBloc loginScreenBloc;
  final bool hasError;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final loginConroller = TextEditingController();
  final passwordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return SingleChildScrollView(
        child: Column(
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
              child: const Text('Telephone',
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
                    hintText: " введите telephone",
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

            widget.hasError
                ? const Text("Ошибка в логине/пароле",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15
                ))
                : const Text(""),

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
                        "Telephone: 79221110",
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
                left: MediaQuery.of(context).size.width * 0.2,
                right: MediaQuery.of(context).size.width * 0.2,
              ),
              width: double.infinity,
              child:
                ElevatedButton(
                onPressed: () {
                  widget.loginScreenBloc.add(LoginToAccount(login: loginConroller.text, password: passwordConroller.text));
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
            )
          ],
        )
    );
  }
}
