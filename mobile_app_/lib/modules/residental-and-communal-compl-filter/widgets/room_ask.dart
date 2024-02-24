





import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoomAsk extends StatefulWidget {
  
  RoomAsk({super.key, required this.ask, required this.room_name, required this.updateAsk, required this.id});

  int id;
  bool ask;
  String room_name;
  final Function(bool, int) updateAsk;

  @override
  State<RoomAsk> createState() => _RoomAskState();
}

class _RoomAskState extends State<RoomAsk> {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width * 0.1,
            child:  Expanded( 
              child:  TextButton(
                onPressed: () {
                  setState(() {
                    widget.updateAsk(!widget.ask, widget.id);
                    widget.ask = !widget.ask;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all( widget.ask ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Указание скругления
                    ),
                  )
                ),
                // _switchValue ? 'true' : 'false'
                child:  Text(widget.room_name, style: const TextStyle(color: Colors.white, fontSize: 14),) 
              )
            )
          );
  }
}

// ignore: must_be_immutable
class RoomAskStud extends StatefulWidget {
  RoomAskStud({super.key, required this.ask, required this.room_name, required this.updateAsk, required this.id});

  int id;
  bool ask;
  String room_name;
  final Function(bool, int) updateAsk;

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
            widget.updateAsk(!widget.ask, widget.id);
            widget.ask = !widget.ask;
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all( widget.ask ? const Color.fromRGBO(35, 79, 104, 1) : const Color.fromARGB(111, 100, 125, 161)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Указание скругления
            ),
          )
        ),
        // _switchValue ? 'true' : 'false'
        child: Text(widget.room_name, style: TextStyle(color: Colors.white),),
      );
  }
}