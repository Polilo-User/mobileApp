


import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/soft_back_arrow.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';
import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/hard_back_arrow.dart';
import 'package:mobile_app_/arguments/filter_argument.dart';

class RoomsList extends StatelessWidget {

  const RoomsList({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HardBackArrow(url: '/rest-commun-filter' , args: const {'previousFilter': FilterType.RoomFilter}),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08, top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02),
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Text("Квартиры", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/room-screen");
                    },
                    child: const Room()
                  )
                );
              }
            )
          )
        ],
      )
    );
  }
}
