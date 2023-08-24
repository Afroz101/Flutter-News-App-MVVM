import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomAppbar.dart';
import 'package:nev_news_with_mvvm/view/widgets/NewsItem.dart';


class SportsPages extends StatelessWidget {
  const SportsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: CustomAppbar(tittleName: "Sport"),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Center();
            }
        )
    );
  }
}
