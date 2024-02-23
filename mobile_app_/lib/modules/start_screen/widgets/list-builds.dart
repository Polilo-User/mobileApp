


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
                    width: 60,
                    height: 60,
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
                    margin: const EdgeInsets.only(left: 300, top: 25),
                    child: IconButton(
                      icon:  
                        SvgPicture.asset(
                           'assets/svg/build-filter.svg',
                            width: 20,
                            height: 20,
                        ),
                      onPressed: () {
                        // Add your button's functionality here
                      },
                    )
                  )
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

