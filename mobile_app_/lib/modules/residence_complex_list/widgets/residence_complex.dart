


import 'package:flutter/material.dart';

class ResidenceComplex extends StatefulWidget {


  const ResidenceComplex({ Key? key }) : super(key: key);

  @override
  _ResidenceComplexState createState() => _ResidenceComplexState();
}

class _ResidenceComplexState extends State<ResidenceComplex> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),  
          decoration: 
            BoxDecoration(
              color: Colors.white,
              boxShadow: [
                  BoxShadow(
                  color: const Color.fromARGB(255, 207, 207, 207).withOpacity(0.5), 
                  spreadRadius: 2, 
                  blurRadius: 3.5,
                  offset: const Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(10), 
            ),
          child: 
            Column(
              children: [
                ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10), 
                        topRight: Radius.circular(10), 
                      ),
                    // url изображения ЖК комплекса
                      child: Stack(
                        children: [ 
                          Image.network(
                            "https://i.pinimg.com/474x/de/a4/ff/dea4ffd5d90a388ccfed949ccdcbac5a.jpg",
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 20,
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.5,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.08,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 80, 80, 80).withOpacity(0.5), // Прозрачный зеленый фон
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'IV кв. 2026',
                                  style: TextStyle(fontSize: 13, color: Colors.white, fontFamily: "Montserrat"),
                                ),
                              ),
                            ),
                          ),
                        ] 
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      // Район
                         const Text("Сити-квартал Октябрьский", style: TextStyle(fontSize: 20)),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: const Color.fromARGB(185, 149, 240, 113),
                              ),
                              child: const Text("₽",
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(185, 70, 130, 47),),
                              textAlign: TextAlign.center,),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "От 6 млн",
                              style: thme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const Text("")
                      ]
                    )
              ),
            ],
        )
  );
}
}