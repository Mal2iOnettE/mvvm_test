import 'package:news_article/Model/model_news_article.dart';

class NewsArticleViewModel {
  ModelNewsArticle _newsArticle;

  NewsArticleViewModel({ModelNewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get url {
    return _newsArticle.url;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }

  String get content {
    return _newsArticle.content;
  }
}
