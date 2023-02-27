
import 'package:flutter/cupertino.dart';
import 'auto_ui.dart';
import 'colors.dart';


///通用文本字体样式
TextStyle commonBlueTextStyle = TextStyle(
  fontSize: 30.sp,
  color: AppColors.blue,
);



///通用按钮文本字体样式 按钮
TextStyle buttonTextStyle = TextStyle(
  fontSize:  36.sp,
  color: AppColors.white,
);

TextStyle textStyle_07C160_26 = getTextStyle(AppColors.color07C160, 26);

TextStyle textStyle_9B9B9B_24 = getTextStyle(AppColors.color9B9B9B, 24);

TextStyle textStyle_FFFFFF_34 = getTextStyle(AppColors.white, 34);
TextStyle textStyle_9B9B9B_26 = getTextStyle(AppColors.color9B9B9B, 26);

TextStyle getTextStyle(Color color, double forntSize) {
  return TextStyle(
      color:  color,
      fontSize: forntSize.sp);
}

class AppFontSize {
  static const double titleSize = 15;
  static const double contentSize = 13;
}