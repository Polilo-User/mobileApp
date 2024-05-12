

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


// ignore: must_be_immutable
class Rooms extends StatefulWidget {
  Rooms({super.key, required this.roomName, required this.description, required this.countRoms});

  String roomName; // "1-комнатные"
  String description; // "от 6 млн до 7,3 млн р от 37,67 до 45,86 м2"
  String countRoms; // "1"

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.07, left: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // название
          Container(
              child:  Text(widget.roomName, style: thme.textTheme.labelLarge,)
          ),

          // параметры
          Container(
            child: Row(
              children: [

                Container(
                  child: Text(widget.description, style: thme.textTheme.bodySmall,),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                  child: SvgPicture.asset(
                    'assets/svg/arrow-triangle-right.svg',
                    width: 20,
                    height: 25,
                  ),
                )

              ]
            )
          ),

          // количество
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.01),
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
            child: Text(widget.countRoms, style: thme.textTheme.bodyLarge,),
          ),
       ]
      )
    );
  }
}
