



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/hard_back_arrow.dart';
import 'package:mobile_app_/modules/residence_complex_screen/widgets/sales_office_child.dart';
import 'package:mobile_app_/repositories/rooms/room.dart' as model;


class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    final model.Room? room;
    final thme = Theme.of(context);

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map) {
      room = args['room'] as model.Room;
    } else {
      throw Exception('Нужно передать квартиру');
    }


    return Scaffold(
      body: Column(
        children: [

            Row (
              children: [
                HardBackArrow(),
                const Expanded(child: SizedBox()),
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.025
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(239, 255, 218, 1),
                    border: const BorderDirectional(
                      bottom: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                      top: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                      start: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                      end: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                    ),
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset("assets/svg/favorite.svg", width: 40, height: 40),
                    onPressed: () {
                      print("кликнули на добавить в избранное");
                    },
                  )
                )
              ],
            ),
          Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.03),
          decoration:
          BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 207, 207, 207).withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3.5,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child:
          Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, left: MediaQuery.of(context).size.width * 0.04, right: MediaQuery.of(context).size.width * 0.04),
                          child: Image(
                            image: const AssetImage("assets/images/rooms_images/one_room.png"),
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        )
                      ]
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("${room.Price * 1000000} ₽", style: thme.textTheme.titleLarge,),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(239, 255, 218, 1),
                              border: const BorderDirectional(
                                bottom: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                                top: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                                start: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                                end: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                              ),
                            ),
                            padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
                            child: Text(
                              "${(room.Price * 1000000 / room.Area).round().toString()} ₽/м2 ",
                              style: thme.textTheme.bodySmall,
                            ),
                          )

                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(room.Name, style: thme.textTheme.bodyMedium)
                      ),

                      SalesOfficeChild(icoPath: 'assets/svg/geo-point.svg', text: 'г. Красноярск'),

                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, bottom: MediaQuery.of(context).size.height * 0.01),
                        child: const Divider(
                            color: Colors.black26
                        )
                      ),

                      const Text("Характеристики"),

                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                        child:  Column(
                          children: [
                            Row(
                              children: [
                                Text("Этаж", style: thme.textTheme.labelSmall,),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Text(room.Floor.toString(), style: thme.textTheme.bodyMedium,)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Комнат", style: thme.textTheme.labelSmall,),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Text(room.CountOfRooms.toString(), style: thme.textTheme.bodyMedium,)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Срок сдачи", style: thme.textTheme.labelSmall,),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Text("IV кв 2025", style: thme.textTheme.bodyMedium,)
                              ],
                            )
                          ],
                        ),
                      )
                    ]
                  )
                ),
              ],
            )
          )
        ],
      )
    );
  }
}

