
import 'package:get/get.dart';


import '../../module/main/main.dart';
import '../../module/register/animation_demo.dart';
import '../../module/register/gesture_hero.dart';
import '../../module/register/login/self_hero.dart';
import '../../module/register/login_page.dart';

class RouteConfig {
  ///主页面
  static const String main = "/";
  static const String login = "/login";


  ///bloc计数器模块 Bloc跨页面传递事件
  static const String cubitSpanOne = "/cubitSpanOne";
  static const String cubitSpanTwo = "/cubitSpanOne/cubitSpanTwo";


  ///Provider
  static const String proSpanOnePage = "/proSpanOnePage";
  static const String proSpanTwoPage = "/proSpanOnePage/proSpanTwoPage";

  ///别名映射页面
  static final List<GetPage> getPages = [
    // GetPage(name: main, page: () => MainPage()),
    // GetPage(name: main, page: () => LoginPage()),
    // GetPage(name: main, page: () => GestureHeroList()),
    // GetPage(name: main, page: () => AnimationDemo()),
    GetPage(name: main, page: () => CustomRectTweenHero()),
  ];
}
