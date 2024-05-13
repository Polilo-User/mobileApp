

import 'package:flutter/material.dart';
import '../../../repositories/news/news.dart' as model;

class NewsCard extends StatefulWidget {
  NewsCard({super.key, required this.news});
  model.News news;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.01
        ),
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
                        widget.news.ImgUrl, // url изображения ЖК комплекса
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.16,
                        fit: BoxFit.cover,
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
                      Text(widget.news.Name, style: const TextStyle(fontSize: 16)),
                      const Text("")
                    ]
                )
            ),
          ],
        )
    );
  }
}
