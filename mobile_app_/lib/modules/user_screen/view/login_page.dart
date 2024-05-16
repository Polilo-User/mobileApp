




import 'package:flutter/material.dart';

import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);

    final loginConroller = TextEditingController();
    final passwordConroller = TextEditingController();

    return Scaffold(
      body:
        Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [

              HardBackArrow(),

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
                  top: MediaQuery.of(context).size.height * 0.05,
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

              // Поле логин
              Container(
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                    controller: loginConroller,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: " введите login",
                    ),
                    style: thm.textTheme.displayMedium,
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

              // Поле логин
              Container(
                  margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: TextField(
                    controller: passwordConroller,
                    decoration: InputDecoration(
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: " введите password",
                    ),
                    style: thm.textTheme.displayMedium,
                    maxLines: 1,
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
          ),
        )
    );
  }
}
