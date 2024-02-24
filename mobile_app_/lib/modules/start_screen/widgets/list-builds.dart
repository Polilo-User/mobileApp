


import 'package:mobile_app_/modules/start_screen/widgets/build.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ListBuilds extends StatefulWidget {
  const ListBuilds({ Key? key }) : super(key: key);

  @override
  _ListBuildsState createState() => _ListBuildsState();
}

class _ListBuildsState extends State<ListBuilds> {
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
                    child: Expanded( child: IconButton(
                      icon:  
                        SvgPicture.asset(
                           'assets/svg/build-filter.svg',
                            width: 20,
                            height: 20,
                        ),
                      onPressed: () {
                        print("pushed filter buttom");
                         Navigator.of(context).pushNamed('/rest-commun-filter', arguments: {});
                      },
                    )
                  ))
              ],
            ),
            Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, i) {
                      return const Build();
                    })
            ),
        ],
      );
  }
}

