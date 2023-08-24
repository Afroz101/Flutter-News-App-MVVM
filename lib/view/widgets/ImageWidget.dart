import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget(
      {Key? key, this.imagename = "", this.imageW, this.imageH, this.boxFit})
      : super(key: key);

  final String? imagename;
  final double? imageW;
  final double? imageH;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagename!.isEmpty ? ImageName.BACK_BUTTON : imagename!,
      width: imageW == 0 ? 50.w : imageW,
      height: imageH == 0 ? 50.w : imageH,
      fit: boxFit,
    );
  }
}
