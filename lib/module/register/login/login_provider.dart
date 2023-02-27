import 'package:flutter/foundation.dart';

class LoginProvider extends  ChangeNotifier {

  late String mobile;
  late  String pwd;
  int loginType;
  bool readPeivacy;

  bool isGetingAccessToken;
  bool islogin;
  bool isBind;//微信授权后是登录还是绑定的开关

  LoginProvider({this.mobile = "",this.pwd = "",this.loginType = 1,this.readPeivacy = false,this.isGetingAccessToken = false,this.islogin = false,this.isBind = false});


}