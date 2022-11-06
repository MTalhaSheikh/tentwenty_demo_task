import 'package:flutter/cupertino.dart';

class SearchServiceModel with ChangeNotifier {
  bool showSearchedList = false;
  bool showSmallCards = false;
  bool showOrgList = true;


  void showSearchedListFun(bool val){
    showSearchedList = val;
    notifyListeners();
  }

  void showSmallCardsFun(bool val){
    showSmallCards = val;
    notifyListeners();
  }

  void showOrigenalListFun(bool val){
    showOrgList = val;
    notifyListeners();
  }

}