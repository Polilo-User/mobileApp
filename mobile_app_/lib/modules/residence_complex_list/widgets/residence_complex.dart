

import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart' as model;
import 'package:flutter/material.dart';

class ResidenceComplex extends StatefulWidget {


   ResidenceComplex({ Key? key, required this.complex }) : super(key: key);

   model.ResidenceComplex complex;

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
                      child: Stack(
                        children: [ 
                          Image.network(
                            widget.complex.imgUrl, // url изображения ЖК комплекса
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
                              child: Center(
                                child: Text(
                                  widget.complex.leadTime,
                                  style: const TextStyle(fontSize: 13, color: Colors.white, fontFamily: "Montserrat"),
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
                        Text(widget.complex.name, style: const TextStyle(fontSize: 16)),
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
                              "${widget.complex.lowestPrice.toString()} млн",
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