import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:nev_news_with_mvvm/routes/PagesName.dart';
import 'package:nev_news_with_mvvm/view/pages/BreakingNews.dart';
import 'package:nev_news_with_mvvm/view/pages/BusinessPages.dart';
import 'package:nev_news_with_mvvm/view/pages/FavPage/FavouriteNews.dart';
import 'package:nev_news_with_mvvm/view/pages/HomePage.dart';
import 'package:nev_news_with_mvvm/view/pages/NewsDetailsPage/NewsDetailsPage.dart';
import 'package:nev_news_with_mvvm/view/pages/SportsPages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case PagesName.BREAKING_NEWS_PAGES:
        return MaterialPageRoute(
          builder: (_) => BreakingNews(),
        );
      case PagesName.BUSINESS_PAGE:
        return MaterialPageRoute(
          builder: (_) => const BusinessPages(),
        );
      case PagesName.SPORT_PAGE:
        return MaterialPageRoute(
          builder: (_) => const SportsPages(),
        );

      case PagesName.NEWSDETAILS_PAGE:
        return MaterialPageRoute(
          builder: (_) => NewsDetailsPage(args as Articles),
        );

      case PagesName.FAVOURITENEWS_PAGE:
        return MaterialPageRoute(
          builder: (_) => FavouriteNews(),
        );
      case PagesName.FAVOURITENEWS_PAGE:
        return MaterialPageRoute(
          builder: (_) => FavouriteNews(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
