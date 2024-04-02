



import 'package:mobile_app_/repositories/filters/filter_repository.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySlider extends StatefulWidget {
  MySlider({
    super.key, 
    required this.lable, 
    required this.units,
    required this.min, 
    required this.max, 
    required this.divisions, 
    required this.valueName,
    required this.filterRepository
  });

  String lable;
  String units;

  double min;
  double max;

  int divisions;
  String valueName;
  final FilterRepository filterRepository;

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
      Column(  
        children: [ 
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03, right: MediaQuery.of(context).size.width * 0.61),
            child: Text(widget.lable, style: theme.textTheme.labelLarge),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4),
            child:  Text("От "
                    "${(widget.filterRepository.valueMap[widget.valueName] as RangeValues).start.round()} "
                    "до ${(widget.filterRepository.valueMap[widget.valueName] as RangeValues).end.round()} "
                    "${widget.units}", style: theme.textTheme.labelLarge),
          ),
           RangeSlider(
            values: widget.filterRepository.valueMap[widget.valueName] as RangeValues,  
            min: widget.min, // Минимальное значение диапазона
            max: widget.max,
            divisions: widget.divisions,

            onChanged: (RangeValues values) {
              setState(() {
                widget.filterRepository.valueMap[widget.valueName] = values;
              });
            }
          )
        ]
      );
  }
}