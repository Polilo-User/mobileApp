




import 'package:flutter/material.dart';


class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
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
                    Container(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.004, left: MediaQuery.of(context).size.width * 0.04, right: MediaQuery.of(context).size.width * 0.04),
                      child: Image.network(
                        "https://s3-alpha-sig.figma.com/img/d1c7/0d7f/feac6c94a84e5a6fa94b23b483d760ec?Expires=1713139200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CAPTkwMJOEihInS88VZOY38Iz16jPGW5jVy52Xh~rbnSD7QOHwPCEurgIbvvBSDJJGUlD8XSIGyaGdQfhGY1iLYEDgG3sa~60bkN59rUyEu3HDlhWNoo83FF8YuLoqCdOYYqwPe1ldMN0PTm9fpqmcBgkavzPzqG0WqOmA0fhF~SCsBTl0dXFPgOxBL2hQWDYgHul6RHZFledvw3bBMRnfodzQysrfQ-GjdjmjHkiavI~cgJONC76zggzdg6v7mKGLgCANL9iv5VZJSzLbdub~6uUeSLKD2mAg1Dw22pVU6Api8duvEz6V-JrFhk50xGY2jWqzKnsq61KRpmvr47~w__",
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    )
                  ]
              )
          ),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("6 000 000 ₽", style: thme.textTheme.titleLarge,),
                        Expanded(
                          child: SizedBox(),
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
                          padding: const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
                          margin: const EdgeInsets.only(right: 15),
                          child: Text(
                            "156 277,94 ₽/м2 ",
                            style: thme.textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("Сити-квартал Октябрьский г.Красноярск", style: thme.textTheme.bodyLarge,)
                    )
                  ]
              )
          ),
        ],
      )
    );
  }
}





