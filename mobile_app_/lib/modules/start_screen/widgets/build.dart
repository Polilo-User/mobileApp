


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
    return ListTile(
       title: Container( 
        margin: const EdgeInsets.only(top: 15, left: 20), // настраиваем радиус скругления
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
            "https://media.istockphoto.com/id/511061090/ru/фото/бизнес-офис-здание-в-лондоне-англия.jpg?s=612x612&w=0&k=20&c=JXTyE-PEYmyuSPQzjflj2CMg3QSLT4VToAPtxdz7SKA=",
            width: 250,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
      subtitle: Container(
          margin: const EdgeInsets.only(top: 5, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
              const Text("Солнечные башни", style: TextStyle(fontSize: 20)), 

              Container(
                  child: Row(
                  children: <Widget>[
                    const Text(
                      "От 6 млн", 
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(width: 5), 
                    SvgPicture.asset(
                      'assets/svg/ruble-sign.svg',
                      width: 14,
                      height: 14,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ]
          )
      ),
    );
  }
}