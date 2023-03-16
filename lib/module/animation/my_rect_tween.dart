import 'dart:ui';

import 'package:flutter/animation.dart';

class CustomRectTween extends RectTween {

  CustomRectTween({ Rect? begin, Rect? end})
      : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    double transformT = Curves.easeInOutBack.transform(t);
    // print(transformT);
    var rect = Rect.fromLTRB(
        _rectMove(begin!.left, end!.left, transformT),
        _rectMove(begin!.top, end!.top, transformT),
        _rectMove(end!.right, end!.right, transformT),
        _rectMove(begin!.bottom, end!.bottom, transformT));

    return rect;
  }

  double _rectMove(double begin, double end, double t) {
    print('${begin *  (1 - t) + end * t}');
    return begin *  (1 - t) + end * t;
  }
}

