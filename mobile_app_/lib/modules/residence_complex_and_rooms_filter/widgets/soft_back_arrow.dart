



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SoftBackArrow extends StatefulWidget {

  SoftBackArrow( {super.key, this.args = null, this.url = null} );

  Map? args;
  String? url;

  @override
  State<SoftBackArrow> createState() => _SoftBackArrowState();
}

class _SoftBackArrowState extends State<SoftBackArrow> {
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
            Navigator.of(context).pushNamed(widget.url!, arguments: widget.args);
          } else {
            Navigator.pop(context, widget.args);
          }
        },
      ),
    );
  }
}
