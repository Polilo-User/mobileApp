


import 'package:flutter/material.dart';
import 'package:mobile_app_/repositories/chat_repository/chat.dart';



class MessageUI extends StatefulWidget {
  MessageUI({super.key, required this.mess, required this.background});

  Message mess;

  Color background;

  @override
  State<MessageUI> createState() => _MessageUIState();
}

class _MessageUIState extends State<MessageUI> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.mess.User}:", style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  )),
                  Text(widget.mess.text, style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    color: Color.fromRGBO(245, 245, 245, 1.0),
                  )),
                ]
            )
        ),
      ],
    );
  }
}
