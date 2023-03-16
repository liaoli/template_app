import 'package:flutter/material.dart';
import 'package:template_app/module/animation/second.dart';

import 'my_rect_tween.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              item(),
              item(),
              item(),
            ],
          ),
        ],
      ),
    );
  }

  Widget item() {
    return GestureDetector(
      child: Container(
        width: 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Color(0xffBB8045),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)]),
        child: Stack(
          children: [
            const Image(
                width: 100,
                height: 120,
                image: AssetImage('assets/images/img.png'),
                fit: BoxFit.cover),
            Container(
                margin: EdgeInsets.only(top: 80),
                child: Container(
                    width: 120,
                    height: 100,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0xffBB8045)])))),
            const Positioned(
                top: 120,
                left: 10,
                child: Text(
                  '今日作品',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
      onTap: () {
        _startHeroAnimation(context);
      },
    );
  }

  void _startHeroAnimation(BuildContext context) {
    // Navigator.push(context, PageRouteBuilder(opaque:false,pageBuilder: (BuildContext context,
    //     Animation<double> animation, Animation<double> secondaryAnimation) {
    //   return FadeTransition(
    //     opacity: animation,
    //     child: FlutterHeroAnimationSecondPage(),
    //   );
    // }));
    Navigator.push(
        context,
        PopRoute(
          child: FlutterHeroAnimationSecondPage(),
        ));
  }
}

class PopRoute extends PopupRoute {
  // push的耗时，milliseconds为毫秒
  final Duration _duration = const Duration(milliseconds: 100);

  // 接收一个child，也就是我们push的内容。
  Widget child;

  // 构造方法
  PopRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
