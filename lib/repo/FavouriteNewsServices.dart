import 'package:nev_news_with_mvvm/db/DatabaseHelper.dart';

import '../models/NewsResponseModel.dart';
import '../providers/FavouriteProvider.dart';

class FavouriteNewsServices {

  Future getFavouriteNewsList(FavouriteProvider favouriteProvider) async {
    // favouriteProvider.setisLoading(true);
    List<Articles> list = await DatabaseHelper.db.getAllSavedNews();
    favouriteProvider.favList = list;
    favouriteProvider.setisLoading(false);
  }

}
