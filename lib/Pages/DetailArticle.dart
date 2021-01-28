import 'package:flutter/material.dart';
import 'package:news_article/ViewModel/Viewmodel_NewsArticle.dart';

class DetailArticle extends StatelessWidget {
  
  final NewsArticleViewModel article;

  const DetailArticle({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
      body: Column(
          children: [
            Container(
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${this.article.urlToImage}"))),
            ),
            Container(padding: EdgeInsets.all(20.0), child: Text("${this.article.description}")),
            Container(padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0), child: Text("${this.article.content}"))
          ],
        ));
  
  }
}

