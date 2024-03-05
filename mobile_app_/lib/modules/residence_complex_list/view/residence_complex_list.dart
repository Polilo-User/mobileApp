


import 'package:mobile_app_/modules/residence_complex_list/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ResidenceComplexList extends StatefulWidget {
  const ResidenceComplexList({ Key? key }) : super(key: key);

  @override
  _ResidenceComplexListState createState() => _ResidenceComplexListState();
}

class _ResidenceComplexListState extends State<ResidenceComplexList> {
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [  
            Row(
              children: [
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
                      left: MediaQuery.of(context).size.width * 0.8, // 10% ширины экрана слева и справа
                      top: MediaQuery.of(context).size.height * 0.05, // 5% высоты экрана сверху и снизу
                    ),
                    child:
                      IconButton(
                        icon:
                          SvgPicture.asset(
                             'assets/svg/build-filter.svg',
                              width: 20,
                              height: 20,
                          ),
                        onPressed: () {
                           Navigator.of(context).pushNamed('/rest-commun-filter', arguments: {});
                        },
                    )
                  )
              ],
            ),
            Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    // этого элемент листа
                    itemBuilder: (context, i) {
                      return const Build();
                    })
            ),
        ],
      );
  }
}

