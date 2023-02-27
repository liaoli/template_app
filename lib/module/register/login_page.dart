import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:template_app/app/ui/colors.dart';

import '../../app/ui/auto_ui.dart';
import '../../app/ui/show.dart';
import '../../app/ui/text_style.dart';
import '../../toolkit/view/button/color_button.dart';
import '../../toolkit/view/button/common_button.dart';
import '../../toolkit/view/checkbox/my_checkbox.dart';
import '../../toolkit/view/line/line.dart';
import 'login/login_input.dart';
import 'login/login_provider.dart';
// import 'package:tencent_kit/tencent_kit.dart';

class LoginPage extends StatefulWidget {
  static const name = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginProvider loginProvider;

  // static const String _TENCENT_APPID = '1109833065';

  // Tencent _tencent = Tencent()..registerApp(appId: _TENCENT_APPID);

  // StreamSubscription<TencentLoginResp> _qqAuth;

  bool isPhone = true;

  @override
  void initState() {
    loginProvider = LoginProvider(readPeivacy: true);

    // _qqAuth = _tencent.loginResp().listen(_qqAuthlisten);
    checkVersionUpgrade();

    super.initState();
  }

  @override
  void dispose() {
    loginProvider?.dispose();
    // _qqAuth?.cancel();
    super.dispose();
  }

  void thirdLogin(Map<String, dynamic> param) {
    // if (loginProvider.islogin) {
    //   return;
    // }
    // loginProvider.islogin = true;
    //
    // Git().thirdLogin(param).then((value) {
    //   if (value.uid != Global.loginModel?.uid) {
    //     Helper().clearDB();
    //   }
    //   userChangedNotifier.loginModel = value;
    //   checkBindMobile(value);
    // }).catchError((onError) {
    //   loginProvider.islogin = false;
    //   loginProvider.isGetingAccessToken = false;
    //   debugPrint('$onError');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>.value(
        value: loginProvider,
        child: Scaffold(
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 60.dp),
              width: double.infinity,
              child: isPhone ? phoneLoginWidget() : wechatWidget()),
        ));
  }

  Material wechatWidget() {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 137.dp,
          ),
          _logo(),
          SizedBox(
            height: 115.dp,
          ),
//                  _loginInput(),
//                  _changLoginWay(),

          weChatLogin(),

          Expanded(child: SizedBox()),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Line(
                color: AppColors.colorE5E5E5,
                width: 130.dp,
              ),
              Text(
                '其它登录方式',
                style: textStyle_9B9B9B_24,
              ),
              Line(
                color: AppColors.colorE5E5E5,
                width: 130.dp,
              )
            ],
          ),
          SizedBox(
            height: 40.dp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // appleLoginWidget(),
              go2PhoneLogin(),
            ],
          ),
          SizedBox(
            height: 40.dp,
          ),
          _serverAndPrivacy(center: true),
          SizedBox(
            height: 80.dp,
          ),
        ],
      ),
    );
  }

  SingleChildScrollView phoneLoginWidget() {
    return SingleChildScrollView(
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 137.dp,
            ),
            _logo(),
            SizedBox(
              height: 115.dp,
            ),
//                  _loginInput(),
//                  _changLoginWay(),

            phoneLogin(),

            SizedBox(
              height: 40.dp,
            ),
            _serverAndPrivacy(),
            SizedBox(
              height: 119.dp,
            ),
            // _thirdLogin(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Image.asset(
      'assets/images/ic_launcher.png',
      // false
      //     ? 'assets/images/login_logo_ios.png'
      //     : 'assets/images/login_logo.png',
      height: 350.dp,
      width: 269.dp,
    );
  }

  Widget phoneLogin() {
    return Column(
      children: [
        LoginInputWidget(),
        SizedBox(
          height: 20.dp,
        ),
        _login(),
      ],
    );
  }

  Widget weChatLogin() {
    return FutureBuilder<bool>(
      future: Future.value(true),
      builder: (context, isAvailableSnapshot) {
        if (!isAvailableSnapshot.hasData) {
          if (mounted) {
            // setState(() {
            isPhone = true;
            // });
          }

          return Container();
        }

        if (isAvailableSnapshot?.data ?? false) {
          isPhone = false;
        } else {
          isPhone = true;
        }

        // if(mounted){
        //   setState(() {
        //
        //   });
        // }
        return isAvailableSnapshot?.data??false
            ? ColorButton(
                width: 580.dp,
                height: 90.dp,
                radius: 55.dp,
                onTap: wechatAuth,
                color: AppColors.color07C160,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/weixin_logo_bt_icon.png',
                        width: 50.dp,
                        height: 50.dp,
                      ),
                      SizedBox(
                        width: 20.dp,
                      ),
                      Text(
                        '微信登录',
                        style: textStyle_FFFFFF_34,
                      ),
                    ],
                  ),
                ))
            : phoneLogin();
      },
    );
  }

  Widget _login() {
    return CommonButton(
      text: '登  录',
      onTap: () {
        if (loginProvider.mobile == null || loginProvider.mobile.isEmpty) {
          showToast('手机号不能为空');
          return;
        }

        if (loginProvider.pwd == null || loginProvider.pwd.isEmpty) {
          String s = loginProvider.loginType == 1 ? '密码不能为空' : '请输入验证码';
          showToast(s);
          return;
        }
        // Git()
        //     .login(loginProvider.mobile, loginProvider.pwd,
        //         loginProvider.loginType)
        //     .then((value) {
        //   print(value);
        //   if (value.uid != Global.loginModel?.uid) {
        //     Helper().clearDB();
        //   }
        //   userChangedNotifier.loginModel = value;
        //
        //   if (value.weichat != 1 && !Global.audit) {
        //     showBindWechatDialog(context, bindWechat: () {
        //       loginProvider.isBind = true;
        //       wechatAuth();
        //     }, close: () {
        //       go2MianPage();
        //     });
        //   } else {
        //     go2MianPage();
        //   }
        // }).catchError((error) {
        //   print(error);
        // });
      },
    );
  }

  void go2MianPage() {
    // Navigator.pushReplacement(context, FadeRoute(page: MainPage()));
  }

  void checkBindMobile() {}

  Widget serverAndPrivacy() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "我已阅读并同意",
            style: textStyle_9B9B9B_26,
          ),
          TextSpan(
            text: '服务协议',
            style: TextStyle(
                color: AppColors.color07C160,
                fontSize:26.sp,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // go2H5WithUrl(context, '${appName()}用户服务协议', rights);
              },
          ),
          TextSpan(
            text: '和',
            style: textStyle_9B9B9B_26,
          ),
          TextSpan(
            text: '隐私政策',
            style: TextStyle(
                color: AppColors.color007AFF,
                fontSize: 26.sp,
                decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // go2H5WithUrl(context, '用户隐私政策', privacy);
              },
          ),
        ],
      ),
    );
  }

  _serverAndPrivacy({bool center = false}) {
    return Row(
      mainAxisAlignment:
          center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        MyCheckBox(
          value: loginProvider.readPeivacy,
          rightWidget: serverAndPrivacy(),
          size: 28.dp,
          onChanged: (value) {
            loginProvider.readPeivacy = value;
          },
        ),
      ],
    );
  }

  // final Future<bool> _isAvailableFuture = AppleSignIn.isAvailable();

  // Widget _thirdLogin() {
  //   return Visibility(
  //     visible: true,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         weChat(),
  //         Visibility(visible: Platform.isIOS, child: appleLoginWidget()),
  //         // qqLoginWidget()
  //       ],
  //     ),
  //   );
  // }

  // Widget weChat() {
  //   return FutureBuilder<bool>(
  //     future: isWeChatInstalled,
  //     builder: (context, isAvailableSnapshot) {
  //       if (!isAvailableSnapshot.hasData) {
  //         return Container();
  //       }
  //       return isAvailableSnapshot.data
  //           ? GestureDetector(
  //               onTap: wechatAuth,
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 50.dp),
  //                 child: Image.asset(
  //                   'assets/images/weixin.png',
  //                   width: 91.dp,
  //                   height: 91.dp,
  //                 ),
  //               ),
  //             )
  //           : Visibility(
  //               visible: false,
  //               child: Container(),
  //             );
  //     },
  //   );
  // }

  // Widget qqLoginWidget() {
  //   return FutureBuilder<bool>(
  //     future: _tencent.isQQInstalled(),
  //     builder: (context, isAvailableSnapshot) {
  //       if (!isAvailableSnapshot.hasData) {
  //         return Container();
  //       }
  //       return isAvailableSnapshot.data
  //           ? GestureDetector(
  //               onTap: () {
  //                 _tencent.login(
  //                   scope: <String>[TencentScope.GET_USER_INFO],
  //                 );
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 50.dp),
  //                 child: Image.asset(
  //                   'assets/images/qq.png',
  //                   width: 91.dp,
  //                   height: 91.dp,
  //                 ),
  //               ),
  //             )
  //           : Visibility(
  //               visible: false,
  //               child: Container(),
  //             );
  //     },
  //   );
  // }

  // FutureBuilder<bool> appleLoginWidget() {
  //   return FutureBuilder<bool>(
  //     future: _isAvailableFuture,
  //     builder: (context, isAvailableSnapshot) {
  //       if (!isAvailableSnapshot.hasData) {
  //         return Container();
  //       }
  //       return isAvailableSnapshot.data
  //           ? GestureDetector(
  //               onTap: logInWithApple,
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 90.dp),
  //                 child: Image.asset(
  //                   'assets/images/apple.png',
  //                   width: 91.dp,
  //                   height: 91.dp,
  //                 ),
  //               ),
  //             )
  //           : Container();
  //     },
  //   );
  // }

  // void logInWithApple() async {
  //   final AuthorizationResult result = await AppleSignIn.performRequests([
  //     AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
  //   ]);
  //
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       // Store user ID
  //
  //       String identityToken =
  //           String.fromCharCodes(result.credential.identityToken);
  //       String authorizationCode =
  //           String.fromCharCodes(result.credential.authorizationCode);
  //       String userId = result.credential.user;
  //
  //       String ss =
  //           'identityToken = $identityToken,authorizationCode = $authorizationCode,userId =$userId';
  //       print(ss);
  //
  //       String familyName = result.credential.fullName.familyName == null
  //           ? ''
  //           : result.credential.fullName.familyName;
  //       String givenName = result.credential.fullName.givenName == null
  //           ? ''
  //           : result.credential.fullName.givenName;
  //
  //       String userName = familyName + givenName;
  //
  //       Map<String, dynamic> param = {
  //         "userId": userId,
  //         'userName': userName,
  //         'type': 8
  //       };
  //
  //       thirdLogin(param);
  //
  //       break;
  //
  //     case AuthorizationStatus.error:
  //       print("Sign in failed: ${result.error.localizedDescription}");
  //
  //       break;
  //
  //     case AuthorizationStatus.cancelled:
  //       print('User cancelled');
  //       break;
  //   }
  // }

  void wechatAuth() {
    // fluwx
    //     .sendWeChatAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
    //     .then((data) {
    //   debugPrint('$data');
    // }).catchError((error) {
    //   debugPrint(error);
    // });
  }

  void checkVersionUpgrade() {}

  // void _qqAuthlisten(TencentLoginResp resp) {
  //   String content =
  //       'qq openid : ${resp.openid} -  accessToken:${resp.accessToken}';
  //   debugPrint(content);
  //   Map<String, dynamic> param = {
  //     "open_id": resp.openid,
  //     'access_token': resp.accessToken,
  //     'type': 6
  //   };
  //
  //   thirdLogin(param);
  // }

  Widget go2PhoneLogin() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          isPhone = true;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 90.dp),
        child: Image.asset(
          'assets/images/login_phone.png',
          width: 91.dp,
          height: 91.dp,
        ),
      ),
    );
  }
}
