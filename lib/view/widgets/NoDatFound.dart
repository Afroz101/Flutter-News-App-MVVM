import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/utils/Color.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';
import 'package:nev_news_with_mvvm/view/widgets/ImageWidget.dart';
import 'package:nev_news_with_mvvm/view/widgets/TextWidget.dart';

class NoDatFound extends StatelessWidget {
  const NoDatFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          imagename: ImageName.NO_DATAFOUND,
          imageH: 250.w,
          imageW: 250.h,
        ),
        TextWidget(
          textsize: 50.sp,
          textcolor: black_50,
          text: "No Data Found",
        )
      ],
    );
  }
}
