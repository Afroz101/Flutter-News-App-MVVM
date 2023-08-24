import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/utils/Color.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';
import 'package:nev_news_with_mvvm/view/widgets/ImageWidget.dart';
import 'package:nev_news_with_mvvm/view/widgets/TextWidget.dart';

//
// Enum ButtonPressType{
//
// }

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar(
      {super.key,
      required this.tittleName,
      this.isShowBackBtn,
      this.rIconName,
      this.isRightSideBtn,
      this.onPressed});

  final String tittleName;
  final bool? isShowBackBtn;
  final bool? isRightSideBtn;
  final String? rIconName;
  final Function(int)? onPressed;

  // bool isHideBack = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: SafeArea(
        child: Container(
            width: double.maxFinite,
            height: 200.h,
            color: colorPrimary,
            child: Padding(
              padding: EdgeInsets.all(40.w),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Visibility(
                    visible: isShowBackBtn ?? false,
                    child: InkWell(
                      onTap: () {
                        if (onPressed != null) {
                          onPressed!(1);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(15.w),
                        child: ImageWidget(
                          imageW: 80.w,
                          imageH: 80.w,
                        ),
                      ),
                    ),
                  ),

                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: TextWidget(
                      textsize: 60.sp,
                      textStyle: FontWeight.bold,
                      textAlign: TextAlign.center,
                      text: tittleName,
                    ),
                  )),
                  Visibility(
                      visible: isRightSideBtn ?? false,
                      child: Positioned(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            if (onPressed != null) {
                              onPressed!(2);
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.all(15.w),
                              child: ImageWidget(
                                  imageW: 80.w,
                                  imageH: 80.w,
                                  imagename: rIconName ?? ImageName.FAV_1)),
                        ),
                      )))
                  // ImageWidget()
                ],
              ),
            )),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 220.h);
}
