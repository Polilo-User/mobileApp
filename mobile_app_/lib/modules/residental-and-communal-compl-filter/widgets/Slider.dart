




import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySlider extends StatefulWidget {
  MySlider({
    super.key, 
    required this.lable, 
    required this.description, 
    required this.min, 
    required this.max, 
    required this.divisions, 
    required this.values,
    required this.valueName,
    required this.updateCoast
  });

  String lable;
  String description;
  double min;
  double max;
  int divisions; 
  String valueName;
  RangeValues values;

  Function(RangeValues, String) updateCoast;

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
            child: Text(widget.description, style: theme.textTheme.labelLarge),
          ),
          Container(
            child: RangeSlider(
            values: widget.values,
            min: widget.min, // Минимальное значение диапазона
            max: widget.max,
            divisions: widget.divisions,

            onChanged: (RangeValues values) {
              setState(() {
                widget.updateCoast(values, widget.valueName);
                widget.values = values;
              });
            }
            )
          ),
        ]
      );
  }
}