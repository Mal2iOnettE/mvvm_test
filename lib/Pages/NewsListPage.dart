import 'package:flutter/material.dart';
import 'package:news_article/Pages/DetailArticle.dart';
import 'package:news_article/ViewModel/Viewmodel_ListNews.dart';
import 'package:news_article/ViewModel/Viewmodel_NewsArticle.dart';
import 'package:news_article/Widget/NewsList.dart';
import 'package:news_article/utils/alertDialog.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false).populateTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("News Article"),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
            child: Container(
              width: 380.0,
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  //fetch all news to keywords
                  value.isNotEmpty ? viewmodel.searchByKeyWords(value) : throw Exception("Not Found");
                },
                decoration: InputDecoration(
                  //labelText: "KEYWORDS",
                  hintText: "Enter key word(s)",
                  icon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.clear),
                ),
                onTap: () {
                  _controller.clear();
                },
              ),
            ),
          ),
          _buildList(viewmodel)
          /* Expanded(
              child: viewmodel.articles.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text("NOT FOUND.....Anything, Sorry."),
                    )
                  : NewsList(articles: viewmodel.articles))*/
        ]));
  }

  Widget _buildList(NewsArticleListViewModel viewModel) {
    switch (viewModel.loadingstatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        Future.delayed(Duration.zero, () => _showAlert(context,viewModel));
        return Expanded(child: NewsList(articles: viewModel.articles));
      case LoadingStatus.completed:
        return Expanded(child: NewsList(articles: viewModel.articles));
    }
  }

  _showAlert(BuildContext context,NewsArticleListViewModel viewModel) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Warning!!!!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Not Found.....anything'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                LoadingStatus.completed == LoadingStatus.completed 
                ? Expanded(child: NewsList(articles: viewModel.articles))
                :Text("Error");
               
              },
            ),
          ],
        );
      },
    );
  }
}
