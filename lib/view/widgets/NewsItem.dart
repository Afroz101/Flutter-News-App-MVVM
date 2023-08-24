import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/db/DatabaseHelper.dart';
import 'package:nev_news_with_mvvm/models/NewsResponseModel.dart';
import 'package:nev_news_with_mvvm/routes/PagesName.dart';
import 'package:nev_news_with_mvvm/utils/Color.dart';
import 'package:nev_news_with_mvvm/utils/DataFormat.dart';
import 'package:nev_news_with_mvvm/utils/ViewMarzine.dart';
import 'package:nev_news_with_mvvm/view/widgets/ImageWidgetForUrl.dart';
import 'package:nev_news_with_mvvm/view/widgets/TextWidget.dart';

class NewsItem extends StatelessWidget {
  List<Articles> articlesList;
  bool? fromFav = false;

  NewsItem({super.key, required this.articlesList, this.fromFav = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(articlesList[index].toString()),
                  onDismissed: (direction) {
                    DatabaseHelper.db.delete(articlesList[index].url!);
                  },
                  background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: TextWidget(
                            textStyle: FontWeight.bold,
                            textsize: 45.sp,
                            text: "DELETE",
                            textcolor: Colors.white,
                          ),
                        ),
                      )),
                  direction: !fromFav!
                      ? DismissDirection.none
                      : DismissDirection.endToStart,
                  child: InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamed(
                          PagesName.NEWSDETAILS_PAGE,
                          arguments: articlesList[index]);
                    },
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            leftMargin(left_margin: 30),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                // Image border
                                child: ImageWidgetForUrl(
                                  imageUrl:
                                      articlesList[index].urlToImage ?? "",
                                )),
                            leftMargin(left_margin: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                topMargin(top_margin: 50.h),
                                TextWidget(
                                  textsize: 45.sp,
                                  textStyle: FontWeight.bold,
                                  text: articlesList[index].source?.name,
                                  textcolor: black_50,
                                ),
                                topMargin(top_margin: 30),
                                TextWidget(
                                  textsize: 50.sp,
                                  likeSpace: 1.5,
                                  textStyle: FontWeight.normal,
                                  text: articlesList[index].title,
                                  textcolor: black,
                                ),
                                topMargin(top_margin: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 40.w, top: 50.h),
                                    child: TextWidget(
                                      textAlign: TextAlign.right,
                                      textsize: 45.sp,
                                      textStyle: FontWeight.normal,
                                      text: DataFormat.formatDate(
                                          articlesList[index].publishedAt!),
                                      textcolor: black_50,
                                    ),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40.h, bottom: 30.h),
                          height: 0.5,
                          color: black_50,
                          width: double.maxFinite,
                        )
                      ],
                    ),
                  ));
            }));
  }
}
