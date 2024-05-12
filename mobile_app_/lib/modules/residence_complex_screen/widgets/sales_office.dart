

import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/modules/residence_complex_screen/blocs/drop_down_bloc/drop_down_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/residence_complex_screen/widgets/sales_office_child.dart';

class SalesOffice extends StatefulWidget {

  const SalesOffice({super.key, required this.onUpPressed, required this.onDownPressed});

  final VoidCallback onUpPressed;
  final VoidCallback onDownPressed;


  @override
  State<SalesOffice> createState() => _SalesOfficeState();
}

class _SalesOfficeState extends State<SalesOffice> {

  final dropDownBlock = DropDownBloc();

  @override
  void initState() {
    // добавляем нужный event в bloc
    dropDownBlock.add(CollapseListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return   // Выпадающий список приймуществ
      Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.08),
          child: BlocBuilder<DropDownBloc, DropDownState>(
            bloc: dropDownBlock,
            builder: (context, state) {

              final dropDownButton = InkWell(
                onTap: () {
                  if (state is CollapsedListState) {
                    dropDownBlock.add(ExpandListEvent());
                    widget.onDownPressed();
                  }
                  else {
                    dropDownBlock.add(CollapseListEvent());
                    widget.onUpPressed();
                  }
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
                      child: Text("Офис продаж", style: thme.textTheme.bodyMedium,),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                        margin:
                        state is CollapsedListState
                            ?  EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.06)
                            : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.07),
                        child: SvgPicture.asset(
                          state is CollapsedListState ? 'assets/svg/arrow-triangle-right.svg' : 'assets/svg/arrow-triangle-bottom.svg',
                          width: state is CollapsedListState ? 20 : 8,
                          height: state is CollapsedListState ? 20 : 8,
                        )
                    ),
                  ],
                ),
              );

              if(state is CollapsedListState){
                return dropDownButton;
              }

              if(state is ExpandedListState) {
                return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      dropDownButton,

                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.03),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12),
                        child: Column(
                          children: [

                            //  'assets/svg/geo-point.svg' and 'г. Красноярск'
                            SalesOfficeChild(icoPath: 'assets/svg/geo-point.svg', text: 'г. Красноярск'),

                            // 'assets/svg/green-clock.svg' and 'В рабочее время с 9:00 до 18:00'
                            SalesOfficeChild(icoPath: 'assets/svg/green-clock.svg', text: 'В рабочее время с 9:00 до 18:00'),

                            // 'assets/svg/green-phone.svg' and '+7 (391) 217-87-23'
                            SalesOfficeChild(icoPath: 'assets/svg/green-phone.svg', text: '+7 (391) 217-87-23'),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.03),
                      ),

                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromRGBO(35, 79, 104, 1)
                                    )
                                ),
                                onPressed: () {
                                },
                                child: const Text('Помещения', style: TextStyle(color: Colors.white)), // Текст кнопки
                              )
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all( const Color.fromRGBO(118, 197, 19, 1))
                            ),
                            onPressed: () {
                            },
                            child: const Text('Маршрут', style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )

                    ],
                );
              }
              return Container();
            },
          )
      );
  }
}
