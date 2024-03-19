

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow.dart';

class ResidenceComplexScreen extends StatefulWidget {
  const ResidenceComplexScreen({super.key});

  @override
  State<ResidenceComplexScreen> createState() => _ResidenceComplexScreenState();
}

class _ResidenceComplexScreenState extends State<ResidenceComplexScreen> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return Scaffold(
      body: Column(
          children: [

            Stack(
              children: [
                Image.network(
                  "https://i.pinimg.com/474x/de/a4/ff/dea4ffd5d90a388ccfed949ccdcbac5a.jpg",
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child:  Center(
                    child: BackArrow(backUrl: '/')
                  ),
                ),
              ]
            ),

            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.03,
                      left: MediaQuery.of(context).size.width * 0.06,
                      bottom: MediaQuery.of(context).size.width * 0.02
                  ),
                  child: const Text("Сити-квартал Октябрьский")
                ),


              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06, bottom: MediaQuery.of(context).size.width * 0.02),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color.fromARGB(185, 149, 240, 113),
                    ),
                    child: const Text("₽",
                      style: TextStyle(fontSize: 17, color: Color.fromARGB(185, 70, 130, 47),),
                      textAlign: TextAlign.center,),
                  ),
                  const SizedBox(width: 5),
                  Text("От 6 млн", style: thme.textTheme.bodySmall,),
                ],
              ),

              // квартиры
                InkWell(
                  onTap: () {
                    print('кликнули по квартирам');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.06, top: MediaQuery.of(context).size.width * 0.02, bottom: MediaQuery.of(context).size.width * 0.02),
                    child:  Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Кваритиры", style: thme.textTheme.labelLarge,),
                            Text("От 6 млн", style: thme.textTheme.bodySmall),
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(239, 255, 218, 1),
                            border: const BorderDirectional(
                              bottom: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                              top: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                              start: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                              end: BorderSide(color: Color.fromRGBO(118, 197, 19, 1)),
                            ),
                          ),
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.5),
                          padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
                          child: Text("32", style: thme.textTheme.bodyLarge,),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.030),
                          child: SvgPicture.asset(
                            'assets/svg/arrow-triangle-right.svg',
                            width: 20,
                            height: 25,
                          ),
                        )

                      ],
                    )
                  )
                ),
            ],
          )
        ],
      ),
    );
  }
}
