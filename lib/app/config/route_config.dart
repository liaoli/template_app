
import 'package:get/get.dart';

import '../../module/main/main.dart';

class RouteConfig {
  ///主页面
  static const String main = "/";

  ///演示SmartDialog控件 喜马拉雅  Animation
  static const String himalaya = "/himalaya";
  static const String smartDialog = "/smartDialog";
  static const String animation = "/animation";

  ///bloc计数器模块 Bloc跨页面传递事件
  static const String blCubitCounterPage = "/blCubitCounterPage";
  static const String blBlocCounterPage = "/blBlocCounterPage";
  static const String cubitSpanOne = "/cubitSpanOne";
  static const String cubitSpanTwo = "/cubitSpanOne/cubitSpanTwo";
  static const String streamPage = "/streamPage";
  static const String blCustomBuilderPage = "/blCustomBuilderPage";
  static const String counterEasyCPage = "/counterEasyCPage";

  ///测试布局页面
  static const String testLayout = "/testLayout";

  ///GetX 计数器  跨页面交互
  static const String getCounterRx = "/getCounterRx";
  static const String getCounterEasy = "/counterEasyGet";
  static const String getCounterHigh = "/counterHighGet";
  static const String getJumpOne = "/jumpOne";
  static const String getJumpTwo = "/jumpOne/jumpTwo";
  static const String getCounterBinding = "/getCounterBinding";
  static const String counterEasyXBuilderPage = "/counterEasyXBuilder";
  static const String counterEasyXEbxPage = "/counterEasyXEbx";

  ///Provider
  static const String proEasyCounterPage = "/proEasyCounterPage";
  static const String proHighCounterPage = "/proHighCounterPage";
  static const String proSpanOnePage = "/proSpanOnePage";
  static const String proSpanTwoPage = "/proSpanOnePage/proSpanTwoPage";
  static const String testNotifierPage = "/testNotifierPage";
  static const String customBuilderPage = "/customBuilderPage";
  static const String counterEasyPPage = "/counterEasyPPage";
  static const String counterGlobalEasyPPage = "/counterGlobalEasyPPage";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => MainPage()),
  ];
}
