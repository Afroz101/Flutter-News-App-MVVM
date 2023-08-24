import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:nev_news_with_mvvm/network/ApiStatus.dart';
import 'package:nev_news_with_mvvm/repo/BreakingNewsServices.dart';
import 'package:nev_news_with_mvvm/view/widgets/SnackBarWidget.dart';

class BreakingNewsProvider extends ChangeNotifier {
  BreakingNewsProvider() {
    getBreakingNews();
  }

  bool _isloading = false;
  List<Articles> _articles = [];

  bool get isloading => _isloading;

  List<Articles> get articles => _articles;

  setArticles(List<Articles> value) {
    _articles = value;
  }

  setIsloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  getBreakingNews() async {
    setIsloading(true);
    var response = await BreakingNewsServices.getBreakingNews();
    if (response is Success) {
      NewsResponseModel newsResponseModel =
          response.response as NewsResponseModel;
      setArticles(newsResponseModel.articles!);
    } else if (response is Failure) {
      SnackBarWidget.instance
          .showSnackBar(message: response.errorResponse.toString());
    }

    setIsloading(false);
  }
}
