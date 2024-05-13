

import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return Container(
      child: Text("В MVP чата не будет 🙈 ", style: thm.textTheme.titleLarge,),
    );
  }
}

