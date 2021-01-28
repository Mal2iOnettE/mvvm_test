import 'package:flutter/material.dart';
import 'package:news_article/Pages/DetailArticle.dart';
import 'package:news_article/ViewModel/Viewmodel_NewsArticle.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  void _showArticleDetail(BuildContext context, NewsArticleViewModel viewModel) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailArticle(article: viewModel)));
  }

  NewsList({this.articles});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];

          return Container(
              //height: 100.0,
              width: 300.0,
              child: ListTile(
                  title: Text("${article.title}"),
                  leading: Container(
                      height: 150.0,
                      width: 100.0,
                      child: article.urlToImage == null ? Image.network("https://via.placeholder.com/150") : Image.network(article.urlToImage)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    _showArticleDetail(context, article);
                  }));
        });
  }
}
