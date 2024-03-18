



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackArrow extends StatefulWidget {
  BackArrow( {super.key, required this.backUrl, this.args = null} );

  String backUrl;
  dynamic? args;

  @override
  State<BackArrow> createState() => _BackArrowState();
}

class _BackArrowState extends State<BackArrow> {
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
          Navigator.of(context).pushNamed(widget.backUrl, arguments: widget.args);
        },
      ),
    );
  }
}
