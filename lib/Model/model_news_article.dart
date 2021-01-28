import 'package:flutter/foundation.dart';

class ModelNewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final int cluster;

  ModelNewsArticle({this.title, this.description, this.url, this.urlToImage, this.content,this.cluster});

  factory ModelNewsArticle.fromJson(Map<String, dynamic> json) {
    return ModelNewsArticle(
        title: json["title"], 
        description: json["description"], 
        url: json["url"], 
        urlToImage: json["urlToImage"], 
        content: json["content"],
        cluster: json["cluster"]
      );
  }
}
