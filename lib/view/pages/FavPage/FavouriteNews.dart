import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/providers/BreakingNewsProvider.dart';
import 'package:nev_news_with_mvvm/providers/FavouriteProvider.dart';
import 'package:nev_news_with_mvvm/repo/BreakingNewsServices.dart';
import 'package:nev_news_with_mvvm/repo/FavouriteNewsServices.dart';
import 'package:nev_news_with_mvvm/view/widgets/CustomAppbar.dart';
import 'package:nev_news_with_mvvm/view/widgets/LoadingIndicator.dart';
import 'package:nev_news_with_mvvm/view/widgets/NewsItem.dart';
import 'package:nev_news_with_mvvm/view/widgets/NoDatFound.dart';
import 'package:provider/provider.dart';

class FavouriteNews extends StatefulWidget {
  @override
  State<FavouriteNews> createState() => _State();
}

class _State extends State<FavouriteNews> {
  late FavouriteProvider _favouriteProvider;
  final FavouriteNewsServices _favouriteNewsServices = FavouriteNewsServices();

  @override
  void initState() {
    super.initState();
    _favouriteProvider = Provider.of<FavouriteProvider>(context, listen: false);
    _favouriteNewsServices.getFavouriteNewsList(_favouriteProvider);
  }

  @override
  Widget build(BuildContext context) {
    FavouriteProvider favouriteProvider = context.watch<FavouriteProvider>();
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        isShowBackBtn: true,
        tittleName: "Fav News",
        onPressed: (p0) {
          Navigator.pop(context);
        },
      ),
      body: Container(
          alignment: Alignment.center,
          child: (favouriteProvider.isLoading)
              ? const LoadingIndicator()
              : favouriteProvider.favList.isNotEmpty
                  ? NewsItem(
                      articlesList: favouriteProvider.favList,
                      fromFav: true,
                    )
                  : const NoDatFound()),
    );
  }
}
