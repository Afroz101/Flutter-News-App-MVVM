import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nev_news_with_mvvm/routes/PagesName.dart';
import 'package:nev_news_with_mvvm/utils/Color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;

  CustomBottomNavigationBar({Key? key,required this.onTap}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 50.w),
          child: GNav(
              padding: EdgeInsets.all(40.w),
              backgroundColor: colorPrimary,
              color: Colors.white,
              activeColor: Colors.white,
              iconSize: 80.w,
              gap: 20.w,
              onTabChange: (value) {
                onTap(value);
              },
              // onTabChange: (value) => _pageNavigation(context, value),
              tabBackgroundColor: tabColor,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.business,
                  text: 'Business',
                ),
                GButton(
                  icon: Icons.sports_cricket,
                  text: 'Spoart',
                ),
              ])),
    );
  }
}
//   void _pageNavigation(BuildContext context, int value) {
//     // if (value == 0) {
//     //   Navigator.pushNamed(context, PagesName.HOME_PAGE);
//     // } else if (value == 1) {
//     //   Navigator.pushNamed(context, PagesName.BUSINESS_PAGE);
//     // } else {
//     //   Navigator.pushNamed(context, PagesName.SPORT_PAGE);
//     // }
//   }
// }
