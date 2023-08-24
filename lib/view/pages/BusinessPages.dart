import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomAppbar.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomBottomNavigationBar.dart';
import 'package:nev_news_with_mvvm/view/widgets/NewsItem.dart';

class BusinessPages extends StatelessWidget {
  const BusinessPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: CustomAppbar(tittleName: "Business"),
        body: Center()
    );
  }
}
