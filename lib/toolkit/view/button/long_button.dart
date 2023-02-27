import 'package:flutter/material.dart';

import '../../../app/ui/auto_ui.dart';
import '../../../app/ui/colors.dart';
import '../../../app/ui/text_style.dart';
import 'color_button.dart';

class LongButton extends StatelessWidget {
  final String text;
  final double? height;
  final GestureTapCallback? ontap;
  final double? radius;
  final Color? bgColor;
  final TextStyle? textstyle;

  const LongButton({
    Key? key,
    this.text = "",
    this.height ,
    this.ontap,
    this.radius,
    this.bgColor,
    this.textstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.dp, vertical: 15.dp),
      child: ColorButton(
        height:  height ?? 72.dp,
        color: bgColor ?? AppColors.primaryBlueText,
        radius: radius ?? 5.dp,
        child: Center(
          child: Text(
            text,
            style: textstyle ?? buttonTextStyle,
          ),
        ),
        onTap: ontap,
      ),
    );
  }
}
