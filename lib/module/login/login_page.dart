
import 'package:flutter/material.dart';

import '../../app/ui/auto_ui.dart';
import '../../app/ui/colors.dart';
import '../../toolkit/view/button/long_button.dart';
import '../main/main.dart';
import 'user_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage>  {
  bool pwdToogle = false;
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  AccountProvider provider = AccountProvider();

  void _removePhone() {
    _unameController.clear();
  }

  void _removePassword() {
    _pwdController.clear();
  }

  @override
  void initState() {
    checkVersionUpgrade();
    super.initState();
  }


  void checkVersionUpgrade() {

  }
  @override
  void dispose() {
    super.dispose();
  }

  void _loginAction(BuildContext context) async {
    if ((_formKey.currentState as FormState).validate()) {

      provider
          .loginAction(_unameController.text, _pwdController.text)
          .then((value) async {

        bool isSucess = value as bool;
        if (isSucess) {

          go2Mainpage(context);
        }
      });
    }
  }

  void go2Mainpage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _unameController.addListener(() {
      setState(() {});
    });
    _pwdController.addListener(() {
      setState(() {});
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                InkWell(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Image(
                            image: AssetImage("assets/images/ic_launcher.png"),
                            width:  72.dp,
                            height: 72.dp,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.blue,
                            ),
                          ),
                        ]),
                  ),
                  onLongPress: () {

                  },
                ),
                _buildPhoneInput(),
                SizedBox(
                  height: 20.dp,
                ),
                _buildPasswordInput(),
                // 登录按钮
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: LongButton(
                    text: '登录',
                    ontap: () => _loginAction(context),
                  ),
                ),

                SizedBox(
                  height: 28,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        '找回密码',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(155, 155, 155, 1),
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    SizedBox(
                      width: 1,
                      height: 16,
                      child: const DecoratedBox(
                        decoration:  BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 1)),
                      ),
                    ),
                    SizedBox(width: 14),
                    GestureDetector(
                      onTap: () => {},
                      child: Text(
                        '新用户注册',
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 号码
  Widget _buildPhoneInput() {
    return TextFormField(
        controller: _unameController,
        // keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => _removePhone(),
            child: _unameController.text != ''
                ? Icon(Icons.cancel, size: 18)
                : SizedBox(),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromRGBO(245, 247, 247, 1),
          hintText: "请输入用户名",
          prefixIcon: Icon(Icons.phone_iphone,),
        ),
        cursorColor: AppColors.primaryColor,
        // 校验用户名
        validator: (v) {
          return v!.trim().length > 0 ? null : "用户名不能为空";
        });
  }

  // 密码
  Widget _buildPasswordInput() {
    return TextFormField(
        controller: _pwdController,
        keyboardType: TextInputType.visiblePassword,
        onEditingComplete: () => _loginAction(context),
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _pwdController.text != ''
                  ? GestureDetector(
                      onTap: () => _removePassword(),
                      child: Icon(Icons.cancel, size: 18))
                  : SizedBox(),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => {
                  setState(() {
                    pwdToogle = !pwdToogle;
                  })
                },
                child: Icon(Icons.remove_red_eye, size: 18),
              ),
              SizedBox(width: 15),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Color.fromRGBO(245, 247, 247, 1),
          hintText: "请输入密码/验证码",
          prefixIcon: Icon(Icons.password
          ),
        ),
        obscureText: !pwdToogle,
        cursorColor: AppColors.primaryColor,
        //校验密码
        validator: (v) {

          String s = v?.trim()??"";

          return  s.length > 5 ? null : "密码不能少于6位";
        });
  }
}
