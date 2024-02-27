




import 'package:mobile_app_/repositories/filters/room_filter_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class RoomAsk extends StatefulWidget {
  
  RoomAsk({super.key, required this.roomName, required this.id});

  int id;

  String roomName;

  @override
  State<RoomAsk> createState() => _RoomAskState();
}

class _RoomAskState extends State<RoomAsk> {

  final RoomFilterRepository roomFilterRepository = GetIt.I<RoomFilterRepository>();

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width * 0.1,
            child:  Expanded( 
              child:  TextButton(
                onPressed: () {
                  setState(() {
                    roomFilterRepository.rooms[widget.id] = !roomFilterRepository.rooms[widget.id];
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( roomFilterRepository.rooms[widget.id] ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Указание скругления
                    ),
                  )
                ),
                // _switchValue ? 'true' : 'false'
                child:  Text(widget.roomName, style: const TextStyle(color: Colors.white, fontSize: 14),) 
              )
            )
          );
  }
}

// ignore: must_be_immutable
class RoomAskStud extends StatefulWidget {
  RoomAskStud({super.key, required this.roomName, required this.id});

  int id;

  String roomName;

  @override
  State<RoomAskStud> createState() => _RoomAskStudState();
}

class _RoomAskStudState extends State<RoomAskStud> {

  final RoomFilterRepository roomFilterRepository = GetIt.I<RoomFilterRepository>();

  @override
  Widget build(BuildContext context) {
    return 
     TextButton(
        onPressed: () {
          setState(() {
            roomFilterRepository.rooms[widget.id] = !roomFilterRepository.rooms[widget.id];
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( roomFilterRepository.rooms[widget.id] ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Указание скругления
            ),
          )
        ),
        // _switchValue ? 'true' : 'false'
        child: Text(widget.roomName, style: TextStyle(color: Colors.white),),
      );
  }
}