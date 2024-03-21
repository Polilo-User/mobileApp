


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BenifitChild extends StatefulWidget {
  BenifitChild({super.key, required this.benifitName});

  String benifitName;

  @override
  State<BenifitChild> createState() => _BenifitChildState();
}

class _BenifitChildState extends State<BenifitChild> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
        child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
                  child: SvgPicture.asset(
                    'assets/svg/green-plus.svg',
                    width: 35,
                    height: 35,
                  )
              ),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                child: Text(widget.benifitName, style: thme.textTheme.bodyLarge,),
              )
            ]
        )
    );
  }
}
