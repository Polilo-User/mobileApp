


import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Новости"),
    );
  }
}
