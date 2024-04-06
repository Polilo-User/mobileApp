



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackArrowWithoutPath extends StatefulWidget {

  BackArrowWithoutPath( {super.key, this.args = null} );

  Map? args;

  @override
  State<BackArrowWithoutPath> createState() => _BackArrowWithoutPathState();
}

class _BackArrowWithoutPathState extends State<BackArrowWithoutPath> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.8, top: MediaQuery.of(context).size.height * 0.02),
      child:  IconButton(
        icon:
        SvgPicture.asset(
          'assets/svg/undo-arrow.svg',
          width: 40,
          height: 40,
        ),
        onPressed: () {
          Navigator.pop(context, widget.args);
        },
      ),
    );
  }
}