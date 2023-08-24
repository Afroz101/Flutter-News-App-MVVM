import 'package:flutter/cupertino.dart';

import '../db/DatabaseHelper.dart';

class PageDetailProvider extends ChangeNotifier {
  // String _url = "";
  bool _isPageStatus = false;
  bool _isFavourite = false;

  bool get isPageStatus => _isPageStatus;

  setisPageStatus(bool value) {
    _isPageStatus = value;
    notifyListeners();
  }

  bool get isFavourite => _isFavourite;

  setIsFavourite(String url) async {
    bool isBo = await DatabaseHelper.db.isAlreadyAdded(url);
    _isFavourite = isBo;
    notifyListeners();
  }
}
