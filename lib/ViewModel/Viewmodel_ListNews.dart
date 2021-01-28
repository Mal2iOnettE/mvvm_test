import 'package:flutter/cupertino.dart';
import 'package:news_article/Model/model_news_article.dart';
import 'package:news_article/ViewModel/Viewmodel_NewsArticle.dart';
import 'package:news_article/Webservice/webServices.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingstatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> searchByKeyWords(String keyword) async {
    this.loadingstatus = LoadingStatus.searching;
    //notifyListeners();
    List<ModelNewsArticle> newsarticles = await WebService().fetchTopHeadlinesByKeyWord(keyword);
    this.articles = newsarticles.map((articles) => NewsArticleViewModel(article: articles)).toList();
    this.loadingstatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadLines() async {
    this.loadingstatus = LoadingStatus.searching;
    //notifyListeners();
    List<ModelNewsArticle> newsarticles = await WebService().fetchTopHeadlines();
    this.articles = newsarticles.map((articles) => NewsArticleViewModel(article: articles)).toList();
    this.loadingstatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
