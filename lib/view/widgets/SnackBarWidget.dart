import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/view/widgets/TextWidget.dart';

import '../../main.dart';

class SnackBarWidget {
  SnackBarWidget._privateConstructor();

  static final SnackBarWidget _instance = SnackBarWidget._privateConstructor();

  static SnackBarWidget get instance => _instance;

  SnackBar _snackBarView(String messsage) {
    return SnackBar(
      content: TextWidget(
        textsize: 40.sp,
        text: messsage,
        textcolor: Colors.white,
      ),
    );
  }

  void showSnackBar({required String message}) {
    if (globalNavigatorKey.currentContext != null) {
      ScaffoldMessenger.of(globalNavigatorKey.currentContext!)
          .showSnackBar(_snackBarView(message));
    }
  }
}
