import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/main.dart';
import 'package:nev_news_with_mvvm/providers/BreakingNewsProvider.dart';
import 'package:nev_news_with_mvvm/repo/BreakingNewsServices.dart';
import 'package:nev_news_with_mvvm/routes/PagesName.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomAppbar.dart';
import 'package:nev_news_with_mvvm/view/widgets/LoadingIndicator.dart';
import 'package:nev_news_with_mvvm/view/widgets/NewsItem.dart';
import 'package:nev_news_with_mvvm/view/widgets/NoDatFound.dart';
import 'package:provider/provider.dart';

class BreakingNews extends StatefulWidget {
  @override
  State<BreakingNews> createState() => _State();
}

class _State extends State<BreakingNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BreakingNewsProvider breakingNewsProvider =
        context.watch<BreakingNewsProvider>();
    return Scaffold(
      // key: globalNavigatorKey,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        tittleName: "Breaking News",
        isRightSideBtn: true,
        rIconName: ImageName.FAV_LIST,
        onPressed: (p0) {
          Navigator.of(context).pushNamed(PagesName.FAVOURITENEWS_PAGE);
        },
      ),
      body: Container(
          alignment: Alignment.center,
          child: (breakingNewsProvider.isloading)
              ? const LoadingIndicator()
              : breakingNewsProvider.articles.isNotEmpty
                  ? NewsItem(
                      articlesList: breakingNewsProvider.articles,

                    )
                  : const NoDatFound()),
    );
  }
}
