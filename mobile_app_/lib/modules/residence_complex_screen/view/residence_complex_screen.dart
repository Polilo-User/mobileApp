

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow.dart';
import 'package:mobile_app_/modules/residence_complex_screen/widgets/sales_office.dart';
import 'package:mobile_app_/modules/residence_complex_screen/widgets/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_/modules/residence_complex_screen/blocs/blocs.dart';

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

      body: SingleChildScrollView(
          child: Column(
          children: [

            // картинка и кнопка назад
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

              // средняя цена
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
                      child: Text("100", style: thme.textTheme.bodyLarge,),
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

              // срок сдачи
              Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.08,
                      left: MediaQuery.of(context).size.width * 0.08,
                      top: MediaQuery.of(context).size.width * 0.08,
                      bottom: MediaQuery.of(context).size.width * 0.02
                  ),
                  child:  Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Сроки сдачи", style: thme.textTheme.bodySmall,),
                          Text("IV КВ. 2026", style: thme.textTheme.labelLarge),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
                        child: const Text("17%", style: TextStyle(
                            color: Color.fromRGBO(118, 197, 19, 1),
                            fontSize: 30,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                    ],
                  )
              ),

              // квартиры фильтр в mvp не будет 😎
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              top: MediaQuery.of(context).size.width * 0.02,
                              bottom: MediaQuery.of(context).size.width * 0.02
                          ),
                          child: Text("Квартиры", style: thme.textTheme.labelLarge,),
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
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.33),
                          padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
                          child:
                          InkWell(
                          onTap: () {
                            print("все строения");
                          },
                          child:
                           Row(
                            children: [
                              Text("Все строения", style: thme.textTheme.bodySmall,),
                              Container(
                                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07),
                                child: SvgPicture.asset(
                                  'assets/svg/arrow-triangle-bottom.svg',
                                  width: 8,
                                  height: 8,
                                ),
                              )
                            ]
                            )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

                // квартиры короткий список
                Rooms(countRoms: "32", roomName: "1-х комнатные", description: "от 6 млн до 7,3 млн р от 37,67 до 45,86 м2",),
                Rooms(countRoms: "64", roomName: "2-х комнатные", description: "от 9 млн до 12 млн р от 74,67 до 90 м2",),
                Rooms(countRoms: "149", roomName: "2-х комнатные", description: "от 9 млн до 12 млн р от 74,67 до 90 м2",),

                // кнопка перехода к квартирам
                Center(
                  child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.08,
                          bottom: MediaQuery.of(context).size.width * 0.08
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          print("хайповая кнопка");
                        },
                        child: const Text('Все квартиры в этом ЖК', style: TextStyle(color: Colors.white, fontFamily: "Montserrat")), // Текст кнопки
                      )
                  ),
                ),

                // Описание ЖК комплекса
                Container(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.08, left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
                  child: Text("""Красноярский жилой комплекс "Солнечный берег" расположен в самом сердце города, на берегу реки Енисей. Этот уникальный комплекс предлагает широкий выбор квартир от студий до просторных пентхаусов, которые будут идеально подходить как для молодых семей, так и для тех, кто ценит комфорт и роскошь. 
                    ЖК "Солнечный берег" отличается современной архитектурой и инновационными решениями, которые сочетают в себе эстетику и функциональность. Здесь предусмотрены все необходимые удобства для комфортной жизни: собственная парковка, детская площадка, спортивная зона, зеленые насаждения и безупречная инфраструктура.""",
                    style: thme.textTheme.bodySmall, textAlign: TextAlign.justify
                  ),
                ),

                Benifits(),
                SalesOffice()

              ],
            )
        ],
      ),
      )
    );
  }
}
