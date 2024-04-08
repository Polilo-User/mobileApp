



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackArrowWithoutPath extends StatefulWidget {

  BackArrowWithoutPath( {super.key, this.args = null, this.url = null} );

  Map? args;
  String? url;

  @override
  State<BackArrowWithoutPath> createState() => _BackArrowWithoutPathState();
}

class _BackArrowWithoutPathState extends State<BackArrowWithoutPath> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01, top: MediaQuery.of(context).size.height * 0.025),
      child:  IconButton(
        icon:
        SvgPicture.asset(
          'assets/svg/undo-arrow.svg',
          width: 40,
          height: 40,
        ),
        onPressed: () {
          if (widget.url != null) {
            Navigator.of(context).popAndPushNamed(widget.url!, arguments: widget.args);
          } else {
            Navigator.pop(context, widget.args);
          }
        },
      ),
    );
  }
}
