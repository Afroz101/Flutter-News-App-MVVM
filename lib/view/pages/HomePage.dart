import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/view/pages/BreakingNews.dart';
import 'package:nev_news_with_mvvm/view/pages/BusinessPages.dart';
import 'package:nev_news_with_mvvm/view/pages/SportsPages.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomAppbar.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomBottomNavigationBar.dart';
import 'package:nev_news_with_mvvm/view/widgets/NewsItem.dart';
import 'package:provider/provider.dart';

import '../../providers/HomePageProvider.dart';

class HomePage extends StatelessWidget {
  // HomePage({super.key});

  final screen = [BreakingNews(), BusinessPages(), SportsPages()];

  @override
  Widget build(BuildContext context) {
    HomePageProvider homePageProvider = context.watch<HomePageProvider>();

    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (selectedIndex) {
            homePageProvider.setSelectedBottomIndex(selectedIndex);
          },
        ),
        body: IndexedStack(
          index: homePageProvider.selectedBottomIndex,
          children: screen,
        ));
  }
}
