import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/config/route_config.dart';

class ProSpanOneProvider extends ChangeNotifier {
  int count = 0;

  ///跳转到跨页面
  void toSpanTwo() {
    Get.toNamed(RouteConfig.proSpanTwoPage);
  }

  ///自增
  void increase() {
    count++;
    notifyListeners();
  }
}
