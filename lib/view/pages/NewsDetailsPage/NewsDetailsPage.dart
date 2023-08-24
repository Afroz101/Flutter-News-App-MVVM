import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nev_news_with_mvvm/db/DatabaseHelper.dart';
import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:nev_news_with_mvvm/providers/PageDetailProvider.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';
import 'package:nev_news_with_mvvm/view/pages/NewsDetailsPage/WebViewCntrl.dart';
import 'package:nev_news_with_mvvm/view/widgets/LoadingIndicator.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/CustomAppbar.dart';

// PageDetailProvider pageDetailProvider = context.watch<PageDetailProvider>();
// mWebViewCntrl.setWebController(url, context, pageDetailProvider);

class NewsDetailsPage extends StatefulWidget {
  Articles articles;

  NewsDetailsPage(this.articles);

  @override
  State<NewsDetailsPage> createState() => NewsDetailWeb();
}

class NewsDetailWeb extends State<NewsDetailsPage> {
  late PageDetailProvider _pageDetailProvider;
  late WebViewCntrl _mWebViewCntrl;

  @override
  void initState() {
    super.initState();
    _mWebViewCntrl = WebViewCntrl();
    _pageDetailProvider =
        Provider.of<PageDetailProvider>(context, listen: false);
    _mWebViewCntrl.setWebController(
        widget.articles.url ?? "", context, _pageDetailProvider);
    _pageDetailProvider.setIsFavourite(widget.articles.url ?? "");
    // });
  }

  @override
  Widget build(BuildContext context) {
    PageDetailProvider pageDetailProvider = context.watch<PageDetailProvider>();
    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: CustomAppbar(
          tittleName: widget.articles.source?.name ?? "Detail",
          isShowBackBtn: true,
          isRightSideBtn: true,
          rIconName: pageDetailProvider.isFavourite
              ? ImageName.FAV_2
              : ImageName.FAV_1,
          onPressed: (clickedIcon) async {
            if (clickedIcon == 1) {
              Navigator.pop(context);
            } else {
              if (!pageDetailProvider.isFavourite) {
                await DatabaseHelper.db.insertNews(widget.articles);
              } else {
                await DatabaseHelper.db.delete(widget.articles.url!);
              }
              pageDetailProvider.setIsFavourite(widget.articles.url ?? "");
            }
          },
        ),
        body: Container(
          alignment: Alignment.center,
          child: pageDetailProvider.isPageStatus
              ? WebViewWidget(controller: _mWebViewCntrl.controller)
              : const LoadingIndicator(),
        ));
  }
}
