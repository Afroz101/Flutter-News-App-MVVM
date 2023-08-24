import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/providers/BreakingNewsProvider.dart';
import 'package:nev_news_with_mvvm/providers/FavouriteProvider.dart';
import 'package:nev_news_with_mvvm/providers/HomePageProvider.dart';
import 'package:nev_news_with_mvvm/providers/PageDetailProvider.dart';
import 'package:nev_news_with_mvvm/routes/PagesName.dart';
import 'package:nev_news_with_mvvm/routes/RouteGenerator.dart';
import 'package:provider/provider.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => BreakingNewsProvider()),
        ChangeNotifierProvider(create: (_) => PageDetailProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1080, 2160),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            initialRoute: PagesName.HOME_PAGE,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      )));
}
