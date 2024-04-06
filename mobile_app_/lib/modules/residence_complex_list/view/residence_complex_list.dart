


import 'package:mobile_app_/modules/residence_complex_list/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ResidenceComplexList extends StatefulWidget {
  const ResidenceComplexList({ Key? key }) : super(key: key);

  @override
  _ResidenceComplexListState createState() => _ResidenceComplexListState();
}

class _ResidenceComplexListState extends State<ResidenceComplexList> {

  int _selectedIndex = -1; // индекс выбранного элемента
  final ScrollController _scrollController = ScrollController(); // контроллер прокрутки

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
                      bottom: MediaQuery.of(context).size.height * 0.01,
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
                           Navigator.of(context).pushNamed('/rest-commun-filter');
                        },
                    )
                  )
              ],
            ),
            Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 8,
                    // этого элемент листа
                    itemBuilder: (context, i) {
                      return  ListTile(
                          selected: i == _selectedIndex,  // проверяем, выбран ли текущий элемент
                          title: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = i; // сохраняем индекс выбранного элемента
                              });
                              Navigator.of(context,
                              ).pushNamed("/residence-complex-screen").then( (_) => {
                                  if (_selectedIndex != -1)
                                  {
                                    // прокручиваем список к выбранному элементу
                                    _scrollController.animateTo(
                                    _selectedIndex * MediaQuery.of(context).size.width * 0.5,
                                    // 50.0 - это высота одного элемента в пикселях
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  )
                                }}
                              );
                            },
                            child: const ResidenceComplex()
                        )
                      );
                    })
            ),
        ],
      );
  }
}

