import 'package:flutter/material.dart';
import 'package:news_article/Pages/NewsListPage.dart';
import 'package:news_article/ViewModel/Viewmodel_ListNews.dart';
import 'package:news_article/utils/alertDialog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fetch News",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
        
        )
    );
  }
}