



import 'package:dio/dio.dart';
import 'package:mobile_app_/repositories/news/models/news.dart';

class NewsRepository {

  Dio dio;
  NewsRepository({required this.dio});

  // Id     int    `json:"id"`
  // Name   string `json:"name"`
  // ImgUrl string `json:"imgUrl"`
  Future<List<News>> getNews() async {
    List<News> news = [];
    var response = await dio.get(
      'http://185.104.114.7:8095/buildings/getBuildingsByFilter'
    );
    final data = response.data as Map<String, dynamic>;
    data['data'].forEach((element) {
      final id = element['id'] as int;
      final name = element['name'] as String;
      final imgUrl = element['imgUrl'] as String;
      final newElement = News(Id: id, Name: name, ImgUrl: imgUrl);
      news.add(newElement);
    });
    return news;
  }
}