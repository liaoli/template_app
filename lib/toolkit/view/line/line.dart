
import 'package:flutter/material.dart';

import 'package:template_app/app/ui/colors.dart';



class Line extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;


  Line(
      {this.width = double.infinity,
      this.height = 0.5,
      this.color = AppColors.colorE5E5E5 ,this.paddingLeft = 0,this.paddingTop = 0,this.paddingRight =0,this.paddingBottom = 0,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(paddingLeft, paddingTop, paddingRight, paddingBottom),
      height: height,
      width: width,
      color: color,
    );
  }
}
