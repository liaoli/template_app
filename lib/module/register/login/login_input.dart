
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_app/app/ui/colors.dart';
import '../../../app/ui/auto_ui.dart';
import '../../../toolkit/view/line/line.dart';
import 'identity_code_widget.dart';
import 'login_provider.dart';

class LoginInputWidget extends StatefulWidget {
  @override
  _LoginInputWidgetState createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  late LoginProvider loginProvider;

  late TextEditingController mobileController;

  late FocusNode mobileFocusNode;

  late TextEditingController passWordController;

  late FocusNode passWordFocusNode;

  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    super.initState();

    mobileController =
    new TextEditingController(text: loginProvider.mobile);


    passWordController =
    new TextEditingController(text: loginProvider.mobile);

//    passWordFocusNode = FocusNode();
//    passWordFocusNode.addListener(() {
//     debugPrint("焦点：${passWordFocusNode.hasFocus}");
//      if (passWordFocusNode.hasFocus) {
//        String text = passWordController.text;
//        passWordController.selection = TextSelection.fromPosition(
//            TextPosition(
//                affinity: TextAffinity.downstream, offset: text.length));
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200.dp,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border:
                Border.all(color: AppColors.colorE5E5E5, width: 0.5),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dp),
                  child: Center(
                    child: TextField(
                      style: TextStyle(fontSize: 13),
                      onChanged: (text) {
                       debugPrint('输入的手机号: $text');
                        loginProvider.mobile = text;
                      },
                      controller: mobileController,
                      cursorColor:  AppColors.colorB2B2B2,
                      decoration: InputDecoration(
                        hintText: "请输入手机号",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Line(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dp),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(

                          obscureText: loginProvider.loginType == 1,
                          style: TextStyle(fontSize: 13),
                          onChanged: (text) {
                           debugPrint('输入的密码: $text');
                            loginProvider.pwd = text;
                          },
                          controller:passWordController,
                          cursorColor: AppColors.colorE5E5E5,
                          decoration: InputDecoration(
                            hintText: loginProvider.loginType == 2
                                ? '请输入验证码'
                                : "请输入密码",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: loginProvider.loginType == 2,
                        child: Line(
                          width: 1.dp,
                          height: 64.dp,
                        ),
                      ),
                      Visibility(
                        visible: loginProvider.loginType == 2,
                        child: IdentityCodeWidget(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _changLoginWay(),
      ],
    );
  }

  Widget _changLoginWay() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.dp),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (loginProvider.loginType == 1) {
                  loginProvider.loginType = 2;
                } else {
                  loginProvider.loginType = 1;
                }
              });
            },
            child: Text(
              loginProvider.loginType == 1 ? '验证码登录' : '密码登录',
              style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 26.sp,
                  decoration: TextDecoration.underline),
            ),
          ),
        )
      ],
    );
  }
}
