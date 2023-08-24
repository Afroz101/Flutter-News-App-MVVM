import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/utils/Color.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.w,
      child: const Center(
        child: CircularProgressIndicator(
          // backgroundColor: colorPrimary,
          // valueColor: AlwaysStoppedAnimation(colorPrimary),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
