


import 'package:mobile_app_/modules/start_screen/widgets/build.dart';
import 'package:flutter/material.dart';

class ListBuilds extends StatefulWidget {
  const ListBuilds({ Key? key }) : super(key: key);

  @override
  _ListBuildsState createState() => _ListBuildsState();
}

class _ListBuildsState extends State<ListBuilds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder( // separated
                itemCount: 8,
                itemBuilder: (context, i) {
                  
                  return Build();
                }),
    );
  }
}

