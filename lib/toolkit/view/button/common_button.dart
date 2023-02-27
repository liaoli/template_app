
import 'package:flutter/material.dart';

import 'package:template_app/app/ui/colors.dart';

class CommonButton extends StatelessWidget {
  final String text;

  final  GestureTapCallback? onTap;

  final double width;
  final double height;

  CommonButton(
      {this.text = "", this.onTap, this.width = double.infinity, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: AppColors.color07C160,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        borderRadius: new BorderRadius.circular(5.0),
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 7,
              ),
              // Image.asset(
              //   "assets/images/start_pan_bt_left_arrow.png",
              //   width: 20,
              //   height: 28,
              // ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              // Image.asset(
              //   "assets/images/start_pan_bt_right_arrow.png",
              //   width: 20,
              //   height: 28,
              // ),
              SizedBox(
                width: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
