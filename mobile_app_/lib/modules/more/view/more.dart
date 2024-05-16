import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class More extends StatefulWidget {
  const More({ Key? key }) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);

    return Container(

      child: Column(
        children: [

          Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
                top: MediaQuery.of(context).size.height * 0.02
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.01,
                bottom: MediaQuery.of(context).size.height * 0.01,
                top: MediaQuery.of(context).size.height * 0.07
            ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 255, 218, 1),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              InkWell(
                  onTap: () {
                    // TODO добавить переход на страницу входа в аккаунт
                    Navigator.of(context).pushNamed("/user-screen");
                  },
                  child:
                   Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      const Icon(
                        Icons.account_circle,
                        color: Color.fromRGBO(118, 197, 19, 1),
                        size: 40,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text('Вход в профиль', style: thm.textTheme.bodyMedium,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.14),
                      Icon(Icons.navigate_next, size: 30,),
                    ],
                )
              )
            ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01
            ),
            child: InkWell(
              onTap: () {
                // TODO добавить переход в избранное
              },
              child:
                Row(
                  children: [
                    Container(

                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.13,
                      ),
                    decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(239, 255, 218, 1),
                        border: const BorderDirectional(
                          bottom: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                          top: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                          start: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                          end: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                        ),
                      ),
                      child: SvgPicture.asset("assets/svg/favorite.svg", width: 40, height: 40)
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Избранное", style: thm.textTheme.labelLarge,),
                        Text("Сохраненная недвижимость")
                      ],
                    )
                ]
              ),
            )
          )
        ],
      ),
    );
  }
}

