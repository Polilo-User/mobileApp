

import 'package:flutter/material.dart';
import 'package:mobile_app_/repositories/user_repository/models/user.dart';
import '../bloc/login_screen_bloc.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key, required this.user, required this.loginScreenBloc});

  final LoginScreenBloc loginScreenBloc;
  User user;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return
      Column(
        children: [

          // Загаловок
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            width: double.infinity,
            child: Text("Личный кабинет", style: thm.textTheme.displayLarge),
          ),

          // Имя пользователя
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("Имя пользователя: ", style: thm.textTheme.displayMedium),
                Expanded(child: SizedBox()),
                Text(widget.user.fio, style: thm.textTheme.displayMedium),
              ],
            ),
          ),

          // номер телефона
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("Номер телефона: ", style: thm.textTheme.displayMedium),
                Expanded(child: SizedBox()),
                Text("+79221110", style: thm.textTheme.displayMedium),
              ],
            ),
          ),

          // кнопка 'войти'
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2,
            ),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.loginScreenBloc.add(Logout());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(35, 79, 104, 1)
                  )
              ),
              child: const Text(
                  "Выйти",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Montserrat"
                  )
              ),
            ),
          )

        ],
      );
  }
}
