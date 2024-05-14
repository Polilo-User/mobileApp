




import 'package:flutter/material.dart';
import '../../../repositories/filters/filter_repository.dart';

// ignore: must_be_immutable
class RoomAsk extends StatefulWidget {
  RoomAsk({super.key, required this.roomName, required this.id, required this.filterRepository});
  IFilterRepository filterRepository ;
  int id;
  String roomName;
  @override
  State<RoomAsk> createState() => _RoomAskState();
}

class _RoomAskState extends State<RoomAsk> {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width * 0.1,
            child:
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.filterRepository.rooms[widget.id] = !widget.filterRepository.rooms[widget.id];
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( widget.filterRepository.rooms[widget.id] ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Указание скругления
                    ),
                  )
                ),
                // _switchValue ? 'true' : 'false'
                child:  Text(widget.roomName, style: const TextStyle(color: Colors.white, fontSize: 14),)
              )
          );
  }
}

// ignore: must_be_immutable
class RoomAskStud extends StatefulWidget {
  RoomAskStud({super.key, required this.roomName, required this.id, required this.filterRepository});
  IFilterRepository filterRepository ;
  int id;
  String roomName;
  @override
  State<RoomAskStud> createState() => _RoomAskStudState();
}

class _RoomAskStudState extends State<RoomAskStud> {
  @override
  Widget build(BuildContext context) {
    return 
     TextButton(
        onPressed: () {
          setState(() {
            widget.filterRepository.rooms[widget.id] = !widget.filterRepository.rooms[widget.id];
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( widget.filterRepository.rooms[widget.id] ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Указание скругления
            ),
          )
        ),
        // _switchValue ? 'true' : 'false'
        child: Text(widget.roomName, style: const TextStyle(color: Colors.white),),
      );
  }
}