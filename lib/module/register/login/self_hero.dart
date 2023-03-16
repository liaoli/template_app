import 'package:flutter/material.dart';


class CustomRectTweenHero extends StatelessWidget {
  const CustomRectTweenHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero 动画路径'),
        brightness: Brightness.dark,
      ),
      body: Container(
        child: Hero(
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: RoundNetworkImage(
            imageUrl:
            "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
            imageSize: 100.0,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: false,
                  builder: (context) => Center(
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: 'edg',
                      createRectTween: (begin, end) {
                        return CustomRectTween(begin: begin!, end: end!);
                      },
                      child: RoundNetworkImage(
                        imageUrl:
                        "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
                        imageSize: 200.0,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          tag: 'edg',
        ),
      ),
    );
  }

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CustomRectTween(begin: begin, end: end);
  }
}

class CustomRectTween extends RectTween {
  final Rect begin;
  final Rect end;

  CustomRectTween({required this.begin, required this.end})
      : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    double transformT = Curves.easeInOutBack.transform(t);

    var rect = Rect.fromLTRB(
        _rectMove(begin.left, end.left, transformT),
        _rectMove(begin.top, end.top, transformT),
        _rectMove(end.right, end.right, transformT),
        _rectMove(begin.bottom, end.bottom, transformT));

    print(rect);
    return rect;
  }

  double _rectMove(double begin, double end, double t) {
    return begin * (1 - t) + end * t;
  }
}



class RoundNetworkImage extends StatelessWidget {
  final VoidCallback onTap;
  final imageUrl;
  final imageSize;
  const RoundNetworkImage(
      {Key? key,
        required this.onTap,
        required this.imageUrl,
        required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: imageSize,
          height: imageSize,
        ),
      ),
      onTap: onTap,
    );
  }
}
