import 'package:flutter/material.dart';
import 'package:template_app/module/register/stagger_animation.dart';

import 'animation_test.dart';
import 'gesture_hero.dart';
import 'login/self_hero.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //匀速

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    //图片宽高从0变到300
    animation = Tween(begin: 0.5, end:3.0).animate(animation)
      ..addListener(() {
        // setState(() => {});
      });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation secondaryAnimation) {
              return FadeTransition(
                //使用渐隐渐入过渡,
                opacity: animation,
                child: GestureHeroList(), //路由B
              );
            },
          ),
        );
      },),
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(
            "assets/images/ic_launcher.png",
            width: 30,height: 20,
          ),
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.asset(
      "assets/images/ic_launcher.png",
      width: animation.value,
      height: animation.value,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({
    Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
