


import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';
import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';
import 'package:mobile_app_/arguments/filter_argument.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow_wihout_path.dart';

class RoomsList extends StatelessWidget {

  const RoomsList({super.key});


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    String? backUrl = null;
    Object? argsFromRoute = null;
    if (args is Map) {
      backUrl = args["to"] as String?;
      argsFromRoute = args["previousFilter"] as FilterType;
    }
    return Scaffold(
      body: Column(
        children: [
          BackArrowWithoutPath(args: { "previousFilter": argsFromRoute },),
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
                    return const Room();
                  })
          ),

        ],
      )
    );
  }
}
