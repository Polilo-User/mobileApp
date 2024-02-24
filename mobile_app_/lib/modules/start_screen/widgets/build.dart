


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Build extends StatefulWidget {
  const Build({ Key? key }) : super(key: key);

  @override
  _BuildState createState() => _BuildState();
}

class _BuildState extends State<Build> {
  @override
  Widget build(BuildContext context) {
    final thme = Theme.of(context);
    return ListTile(

      title: InkWell(
        onTap: () {
          print("Нажатие на карточку");
        },
        child: 
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
                            "https://s3-alpha-sig.figma.com/img/8fc0/ec5d/db97c0e977dd8bfdf277eafb07e29e15?Expires=1709510400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=g68IHVbZ~-PVR6MK7uNXkC4jn8gHVsssXNOpYfwGgJatbAe0-stss~itmPyzCMuY6MjZYxhMywPVlOFHbANZ7FP3Btl40o0SuWiawjXeGMlJNaSN5Z4Gp-acsXbJsg86ia8sYYW41gl48Nt5cb9FTCU4mTD7mnFNWbvFnDUOsk1OsiTEWXMhA7Y0nslGq-gepofTJ7J7YenTR9I1tMtLjQay-IoWMjH871hhWXES~ZAn2Bjjpj1mioUDw4Rw8zRT0I-iWauHDZglMvGVVgGdY9-vKuxz-AKbU98uVBljhRYDz8cWLph0PoSfc1H95td6zWhZW10HIxGU0MbhNTrcfg__",
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
                      Container(
                        child: Row(
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
                          // стоимость
                            Text(
                              "От 6 млн", 
                              style: thme.textTheme.bodySmall,
                            ),
                          ],
                      ),
                    ),
                    const Text("")
                  ]
                )
              ),
            ],
        )
      ),
    )
  );
}
}