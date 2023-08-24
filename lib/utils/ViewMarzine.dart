import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topMargin({required double top_margin}) => SizedBox(height: top_margin.h,);
Widget leftMargin({required double left_margin}) => SizedBox(width: left_margin.w);
Widget bottomMargin({required double bottom_margin}) => SizedBox(height: bottom_margin.h);
Widget rightMargin({required double right_margin}) => SizedBox(width: right_margin.w);