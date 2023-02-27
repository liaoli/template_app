// 登录/用户信息

import 'dart:convert';

import 'package:flutter/material.dart';



class AccountProvider with ChangeNotifier {

  //登录
  Future loginAction(String account, String password,
      {String code = "123"}) async {
    Map params = {
      "loginAccount": account,
      "loginPwd": password,
      "verificationCode": code,
    };
  }

  //注册
  Future registerAction(String account, String password,
      {String code = "123"}) async {
    Map params = {
      "loginAccount": account,
      "loginPwd": password,
      "verificationCode": code,
    };
  }
}
