import 'package:flutter/cupertino.dart';

import '../models/NewsResponseModel.dart';

class FavouriteProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Articles> _favList = [];

  bool get isLoading => _isLoading;

  setisLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Articles> get favList => _favList;

  set favList(List<Articles> value) {
    _favList = value;
  }
}
