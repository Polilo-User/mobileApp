

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow_wihout_path.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';

import '../../../arguments/filter_argument.dart';

import 'package:mobile_app_/repositories/filters/filter_repository.dart';

import '../../../repositories/filters/progect_filters.dart';
import '../../../repositories/filters/room_filter_repository.dart';

class LeadTime extends StatefulWidget {
  const LeadTime({super.key});

  @override
  State<LeadTime> createState() => _LeadTimeState();
}

class _LeadTimeState extends State<LeadTime> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments;
    FilterType? previousFilter;

    if (args is Map) {
      previousFilter = args["previousFilter"] as FilterType;
    }

    if (previousFilter == null) {
      throw Exception("Why previousFilter == null ?");
    }

    final Map<FilterType, FilterRepository> filter = {
      FilterType.RoomFilter: GetIt.I<RoomFilterRepository>(),
      FilterType.ResidentComplexFilter: GetIt.I<ProjectFilterRepository>()
    };

    final FilterRepository filterRepository = filter[previousFilter]!;


    return Scaffold(
      body: Column(
        children: [
          BackArrowWithoutPath(url: '/rest-commun-filter', args: { "previousFilter": previousFilter } ),
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
              final leadTime = filterRepository.AllLeadTime[i];
              return
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01, right: MediaQuery.of(context).size.width * 0.01),
                  child: ListTile(
                    title:
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(filterRepository.AllLeadTime[i] ?? "...", style: Theme.of(context).textTheme.bodyMedium),
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
