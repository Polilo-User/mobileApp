

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class FilterIco extends StatefulWidget {

  FilterIco({super.key, required this.path});

  String path;

  @override
  State<FilterIco> createState() => _FilterIcoState();
}

class _FilterIcoState extends State<FilterIco> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(239, 255, 218, 1),
          borderRadius: BorderRadius.circular(10),
          border: const BorderDirectional(
            bottom: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
            top: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
            start: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
            end: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
          ),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.01,
          left: MediaQuery.of(context).size.width * 0.8, // 10% ширины экрана слева и справа
          top: MediaQuery.of(context).size.height * 0.05, // 5% высоты экрана сверху и снизу
        ),
        child:
        IconButton(
          icon: SvgPicture.asset('assets/svg/build-filter.svg', width: 20, height: 20),
          onPressed: () {
            Navigator.of(context).pushNamed(widget.path);
          },
        )
    );
  }
}
