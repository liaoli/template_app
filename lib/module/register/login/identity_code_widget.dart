import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/ui/auto_ui.dart';
import '../../../app/ui/show.dart';
import '../../../app/ui/text_style.dart';
import 'login_provider.dart';

class IdentityCodeWidget extends StatefulWidget {
  @override
  _IdentityCodeWidgetState createState() => _IdentityCodeWidgetState();
}

class _IdentityCodeWidgetState extends State<IdentityCodeWidget> {
  late Timer _timer; // 定义一个变量，在页面销毁时需要用到，如果在定时器内部已经销毁了，可以不需要
  int _count = 0;
  late LoginProvider loginProvider;

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_count == 0) {
          String mobile = loginProvider.mobile;

          if (mobile == null || mobile.isEmpty) {
            showToast('请输入手机号，以便接受短信验证码');
            return;
          }

          setState(() {
            _count = 60;
          });
          myTimer();
          // Git().getIdentityCode(mobile, '1').then((value) {
          //   setState(() {
          //     _count = 60;
          //   });
          //   myTimer();
          // }).catchError((onError) {
          //  debugPrint(onError);
          // });
        }
      },
      child: Container(
        width: 223.dp,
        height: double.infinity,
        child: Center(
          child: Text(
            _count > 0 ? '${_count}S后可获取' : '获取验证码',
            style: textStyle_07C160_26,
          ),
        ),
      ),
    );
  }

  myTimer() {
    // 定义一个函数，将定时器包裹起来
    _timer = Timer.periodic(Duration(milliseconds: 1000), (t) {
      setState(() {
        if (_count < 1) {
          _timer.cancel();
        } else {
          _count = _count - 1;
        }
      });
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      // 页面销毁时触发定时器销毁
      _timer.cancel();
    }
    super.dispose();
  }
}
