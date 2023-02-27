
import 'package:flutter/material.dart';


class ColorButton extends StatefulWidget {
  final double width;
  final double height;
  final GestureTapCallback? onTap;
  final Color color;
  final Widget? child;
  final double radius;
  final Color borderColor;
  final Gradient? gradient;

  ColorButton(
      {this.width = 20,
      this.height =10,
      this.onTap,
      required this.color,
      this.child,
      this.borderColor = Colors.transparent,
      this.gradient,
      this.radius = 5});

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            gradient: widget.gradient,
            color: widget.color,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            border: Border.all(color: widget.borderColor, width: 1)),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            width: widget.width,
            height: widget.height,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
