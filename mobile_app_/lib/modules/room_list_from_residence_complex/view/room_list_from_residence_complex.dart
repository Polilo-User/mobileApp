



import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/resident_complex_and_rooms_filter.dart';

class RoomListFromResidenceComplex extends StatefulWidget {
  const RoomListFromResidenceComplex({super.key});

  @override
  State<RoomListFromResidenceComplex> createState() => _RoomListFromResidenceComplexState();
}

class _RoomListFromResidenceComplexState extends State<RoomListFromResidenceComplex> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Text("список квартир ЖК")
    );
  }
}
