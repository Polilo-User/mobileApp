




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/repositories/filters/progect_filters.dart';
import 'package:mobile_app_/arguments/filter_argument.dart';

class TextWithArrow extends StatefulWidget {

  TextWithArrow({super.key, required this.filterRepository, required this.previousFilter});

  final ProjectFilterRepository filterRepository;
  final FilterType previousFilter;

  @override
  State<TextWithArrow> createState() => _TextWithArrowState();
}

class _TextWithArrowState extends State<TextWithArrow> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/lead-time", arguments: {"previousFilter": widget.previousFilter});
      },
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              children: [
                Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Срок сдачи", style: thme.textTheme.bodyMedium,),

                    Text(widget.filterRepository.LeadTime!,
                      style: const TextStyle(
                        color: Color.fromRGBO(118, 197, 19, 1),
                        fontFamily: "Montserrat", fontSize: 17
                      ),
                    ),
                  ],
                )
              ]
            )
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
              child: SvgPicture.asset(
                'assets/svg/arrow-triangle-right.svg',
                width: 20,
                height: 20,
              )
          ),
        ],
      ),
    );
  }
}
