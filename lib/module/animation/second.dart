import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../register/login/self_hero.dart';

class FlutterHeroAnimationSecondPage extends StatefulWidget {
  const FlutterHeroAnimationSecondPage({Key? key}) : super(key: key);

  @override
  State<FlutterHeroAnimationSecondPage> createState() =>
      _FlutterHeroAnimationSecondPageState();
}

class _FlutterHeroAnimationSecondPageState
    extends State<FlutterHeroAnimationSecondPage> {
  double verticalDragStart = 0.0;
  double verticalDragUpdate = 1.0;
  double screenHeight = 0.0;
  bool loopControl = true;

  int mill = 0; //判断是否是是否真实拖动

  @override
  Widget build(BuildContext context) {
    if (loopControl) {
      setState(() {
        screenHeight = MediaQuery.of(context).size.height;
        loopControl = false;
      });
    }

    return Scaffold(
      backgroundColor: Color(0x00000000),
      body: GestureDetector(

        onVerticalDragStart: (detail) {
          mill = DateTime.now().millisecondsSinceEpoch;

          setState(() {
            verticalDragStart = 1;
          });
        },
        onVerticalDragEnd: (detail) {
          setState(() {
            verticalDragUpdate = 1.0;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails detail) {
          // if (detail.delta.dy <= 0) {
          //   return;
          // }

          int deltTime = DateTime.now().millisecondsSinceEpoch - mill;
          print('deltTime: $deltTime');
          if (deltTime < 800) {
            return;
          }

          var offsetNum = 200 / (detail.localPosition.dy - verticalDragStart);
          print('offsetNum: $offsetNum');

          print(' detail.delta.dy: ${detail.delta.dy}');
          print(' detail.delta.dx: ${detail.delta.dx}');

          if (offsetNum < 0.4) {
            Navigator.pop(context);
          } else {
            setState(() {
              verticalDragUpdate = offsetNum;
            });
          }

          // print('update: ${detail.localPosition}');
        },
        child: Center(
          child: SizedBox(
            // width:
            //     MediaQuery.of(context).size.width - verticalDragUpdate * 100,
            // height:
            //     MediaQuery.of(context).size.height - verticalDragUpdate * 100,

            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Transform.scale(
              scale: verticalDragUpdate,
              child: Material(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 6 / 5,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100 * (0))),
                      // width: ,
                      child: Stack(
                        children: [
                          Container(
                              child: Image(
                            height: MediaQuery.of(context).size.width * 6 / 5,
                            width: MediaQuery.of(context).size.width,
                            image: AssetImage('assets/images/img.png'),
                            fit: BoxFit.cover,
                          )),
                          Positioned(
                              top: 50,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0x5feeeeee)),
                                  child: Icon(Icons.close),
                                ),
                              )),
                          Positioned(
                              top: 250,
                              left: 10,
                              child: Text('今日作品',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Text('.....'),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
