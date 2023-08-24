import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String? text;
  Color? textcolor;
  double? textsize;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? overflow;
  FontWeight? textStyle;
  double? likeSpace;

  TextWidget(
      {Key? key,
      this.text,
      this.textcolor = Colors.white,
      required this.textsize,
      this.textAlign = TextAlign.left,
      this.maxLines = 0,
      this.overflow = TextOverflow.ellipsis,
      this.textStyle = FontWeight.normal,
      this.likeSpace = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text != null ? text! : "",
        textAlign: textAlign,
        maxLines: maxLines == 0 ? null : maxLines,
        overflow: maxLines == 0 ? null : overflow,
        style: TextStyle(
            height: likeSpace,
            color: textcolor,
            fontSize: textsize,
            fontWeight: textStyle));
  }
}

Text textWidget(String tittleStr, Color textcolor, double t_size) {
  return Text(tittleStr,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: textcolor, fontSize: t_size, fontWeight: FontWeight.bold));
}
