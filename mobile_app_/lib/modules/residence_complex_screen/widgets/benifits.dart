


import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/modules/residence_complex_screen/blocs/drop_down_bloc/drop_down_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app_/modules/residence_complex_screen/widgets/benifit_child.dart';

class Benifits extends StatefulWidget {
  const Benifits({super.key});

  @override
  State<Benifits> createState() => _BenifitsState();
}

class _BenifitsState extends State<Benifits> {


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
                  if (state is CollapsedListState)
                    dropDownBlock.add(ExpandListEvent());
                  else
                    dropDownBlock.add(CollapseListEvent());
                },
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06),
                      child: Text("Приймущества", style: thme.textTheme.bodyMedium,),
                    ),
                    Expanded(
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    dropDownButton,

                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                    ),


                    BenifitChild(benifitName: "Материнский капитал"),
                    BenifitChild(benifitName: "Высокие потолки"),
                    BenifitChild(benifitName: "Охраняема территория"),
                    BenifitChild(benifitName: "ДДУ")

                  ],
                );
              }
              return Container();
            },
          )
      );
  }
}
