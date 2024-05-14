

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/hard_back_arrow.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

import '../../../arguments/filter_argument.dart';
import '../../../repositories/filters/progect_filters.dart';

class LeadTime extends StatefulWidget {
  const LeadTime({super.key});

  @override
  State<LeadTime> createState() => _LeadTimeState();
}

class _LeadTimeState extends State<LeadTime> {
  @override
  Widget build(BuildContext context) {
    final ProjectFilterRepository filterRepository = GetIt.I<ProjectFilterRepository>();

    return Scaffold(
      body: Column(
        children: [
          HardBackArrow(url: '/rest-commun-filter', args: const { "previousFilter": FilterType.ResidentComplexFilter } ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04, top: MediaQuery.of(context).size.height * 0.02,),
            alignment: Alignment.bottomLeft,
            child: Text("Сроки сдачи", style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child:
            ListView.builder(
              itemCount: filterRepository.AllLeadTime.length,
              itemBuilder: (context, i) {
              // final leadTime = filterRepository.AllLeadTime[i];
              return
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01, right: MediaQuery.of(context).size.width * 0.01),
                  child: ListTile(
                    title:
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(filterRepository.AllLeadTime[i], style: Theme.of(context).textTheme.bodyMedium),
                              const Expanded(child: SizedBox()),
                              Radio(
                                  activeColor: const Color.fromRGBO(118, 197, 19, 1),
                                  value: filterRepository.LeadTime,
                                  groupValue: filterRepository.AllLeadTime[i],
                                  onChanged: (value) {
                                    setState(() {
                                      filterRepository.LeadTime = filterRepository.AllLeadTime[i];
                                    }
                                    );
                                  }
                              ),
                            ],
                          ),
                        ],
                      )
                  )
                );
              }
            )
          )
        ],
      ),
    );
  }
}
