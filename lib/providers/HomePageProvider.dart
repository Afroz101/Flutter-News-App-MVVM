
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomePageProvider extends ChangeNotifier {
  int _selectedBottomIndex = 0;

  int get selectedBottomIndex => _selectedBottomIndex;

  setSelectedBottomIndex(int selectedBottomIndex) async {
    _selectedBottomIndex = selectedBottomIndex;
    notifyListeners();
  }
}
