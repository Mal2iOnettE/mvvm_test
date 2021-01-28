import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:news_article/Model/model_news_article.dart';
import 'package:news_article/utils/constants.dart';

class WebService {
  Future<List<ModelNewsArticle>> fetchTopHeadlinesByKeyWord(String keyword) async {
    final responseKey = await http.get(Constants.headLinesFor(keyword));
    if (responseKey.statusCode == 200) {
      final resultkey = jsonDecode(responseKey.body);
      Iterable list = resultkey["articles"];
      return list.map((json) => ModelNewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Failed to get data");
    }
  }

  Future<List<ModelNewsArticle>> fetchTopHeadlines2() async {
    //String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=81bcc286322649509d27ca960a112753";
    //String url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=81bcc286322649509d27ca960a112753";

    final response = await http.get(Constants.Top_Head_Lines);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      //print(result);
      Iterable list = result["articles"];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }

  Future<List<ModelNewsArticle>> fetchTopHeadlines() async {
    String url2 = "http://newsapi.org/v2/top-headlines?country=us&apiKey=81bcc286322649509d27ca960a112753";
    //var url = "http://ecadigital-lab.com/api/Kmeans";

    HttpClient httpClient = new HttpClient()..badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = new IOClient(httpClient);
    ioClient.get(url2);

    final response = await ioClient.get(url2);
    //final http.Response response = await http.Client().get(url2);
    print("this is "+response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      //print(result);
      Iterable list = result[0];
      return list.map((article) => ModelNewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
