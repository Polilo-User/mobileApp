




import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SalesOfficeChild extends StatefulWidget {
  SalesOfficeChild({super.key, required this.icoPath, required this.text});

  String icoPath;
  String text;

  @override
  State<SalesOfficeChild> createState() => _SalesOfficeChildState();
}

class _SalesOfficeChildState extends State<SalesOfficeChild> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return  Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
        child: Row(
            children: [
              Container(
                  child: SvgPicture.asset(
                    widget.icoPath,
                    width: 20,
                    height: 20,
                  )
              ),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                child: Text(widget.text,
                  style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14.25,
                  color: Color.fromRGBO(35, 79, 104, 1),
                  fontWeight: FontWeight.w500
                )), // Color.fromRGBO(35, 79, 104, 1)
              )
            ]
        )
    );
  }
}
