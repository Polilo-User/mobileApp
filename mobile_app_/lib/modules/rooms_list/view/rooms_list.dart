


import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';
import 'package:mobile_app_/arguments/filter_argument.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow.dart';

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
          BackArrow(backUrl: backUrl ?? "/", args: { "previousFilter": argsFromRoute },),
          Text("hello"),
        ],
      )
    );
  }
}
