import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nev_news_with_mvvm/utils/ImageName.dart';
import 'package:nev_news_with_mvvm/view/widgets/ImageWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageWidgetForUrl extends StatelessWidget {
  String imageUrl;

  ImageWidgetForUrl({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 350.w,
        height: 350.w,
        child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: imageUrl.isEmpty
                ? Container(
                    color: Colors.grey,
                    // padding: EdgeInsets.all(_gSize(50, context)),
                    child: ImageWidget(
                      imagename: ImageName.TEST,
                      boxFit: BoxFit.cover,
                    ))
                :
                // : AppUtility.isValidUrl(imageUrl)
                CachedNetworkImage(
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        color: Colors.black12,
                      ),
                    ),
                    placeholder: (context, url) =>
                        Image.asset(ImageName.BACK_BUTTON),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
            // : Image.file(
            //     File(imageUrl),
            //     width: _gSize(200, context),
            //     height: _gSize(200, context),
            //     fit: BoxFit.cover,
            //   ),
            ));
  }
}
