


import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/news/widgets/news_card.dart';

import 'package:get_it/get_it.dart';
import '../../../repositories/news/news.dart' as model;

class News extends StatefulWidget {
  const News({ Key? key }) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {

  model.NewsRepository newsRepository = GetIt.I<model.NewsRepository>();

  Future<List<model.News>> getQuarter() async {
    final result = await newsRepository.getNews();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<model.News>>(
        future: getQuarter(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  Column(
                  children: [

                    Expanded(
                      child:
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.021,
                              right: MediaQuery.of(context).size.width * 0.021,
                          ),
                          child:
                          ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Column(
                                    children: [
                                      Text("События", style: Theme.of(context).textTheme.titleLarge),
                                      NewsCard(news: snapshot.data![index])
                                    ],
                                  );
                                }
                                return NewsCard(news: snapshot.data![index]);
                              }
                        ) ,
                      ),
                    )
                  ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
