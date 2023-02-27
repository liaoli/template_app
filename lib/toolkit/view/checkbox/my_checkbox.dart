import 'package:flutter/material.dart';

import '../../../app/ui/auto_ui.dart';


class MyCheckBox extends StatefulWidget {
  bool value;

  String selected;
  String def;
  double size;

  Function(bool)? onChanged;

  Widget rightWidget;

  MyCheckBox(
      {this.rightWidget = const SizedBox(),
      this.value = false,
      this.selected = "assets/images/six_selected.png",
      this.def = "assets/images/six_unselected.png",
      this.onChanged,
      this.size = 10});

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
          onTap: () {
            upddateValue();
            widget.onChanged!(widget.value);


          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                widget.value ? widget.selected : widget.def,
                width: widget.size,
                height: widget.size,
              ),
              SizedBox(width:  10.dp,),
              widget.rightWidget,
            ],
          )),
    );
  }

  void upddateValue() {
    setState(() {
      widget.value = !widget.value;
    });
  }
}
