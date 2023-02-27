import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_app/toolkit/utils/ui_util.dart';

extension NumExtend on num {
  ///自动适配移动界面
  double get dp {
    //如果没初始化,需要初始化,防止web端直接导航页面报错
    AutoUi().init();
    return UiUtil().setWidth(this);
  }

  ///配置文字,文字适配请用sp单位
  double get sp {
    //如果没初始化,需要初始化,防止web端直接导航页面报错
    AutoUi().init();
    return UiUtil().setWidth(this);
  }
}

class AutoUi {
  factory AutoUi() => _getInstance();

  AutoUi._();

  static AutoUi? _instance;

  static AutoUi _getInstance() => _instance ??= AutoUi._();

  ///是否第一次初始化
  bool first = true;

  void init() {
    if (Get.context == null || !first) return;
    first = false;

    UiUtil.init(
      // 通过context获取设备像素大小
      context: Get.context!,
      // 设计尺寸(前期是先写布局，后做pc/web尺寸适配，故此处统一处理下)
      designSize: const Size(720, 1080),
    );
  }
}
