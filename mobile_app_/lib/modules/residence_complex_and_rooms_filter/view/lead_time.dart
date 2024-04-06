

import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow_wihout_path.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

class LeadTime extends StatefulWidget {
  const LeadTime({super.key});

  @override
  State<LeadTime> createState() => _LeadTimeState();
}

class _LeadTimeState extends State<LeadTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BackArrowWithoutPath(),


        ],
      ),
    );
  }
}
