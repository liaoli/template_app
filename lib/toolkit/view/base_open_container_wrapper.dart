import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenContainerWrapper<T> extends StatelessWidget {
  const OpenContainerWrapper({
    Key? key,
    required this.closedBuilder,
    required this.transitionType,
    this.onClosed,
    this.closedShape = const RoundedRectangleBorder(),
    required this.openBuilder,
    this.closedElevation = 0,
    this.openElevation = 0,
    this.closedColor = Colors.transparent,
    this.openColor = Colors.transparent,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?>? onClosed;
  final OpenContainerBuilder<bool?> openBuilder;
  final ShapeBorder closedShape; //边框颜色
  final double closedElevation;//关闭时阴影
  final double openElevation;//打开时阴影
  final Color closedColor;//关闭背景颜色
  final Color openColor;//打开背景颜色

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: openBuilder,
      onClosed: onClosed ?? showMarkedAsDoneSnackbar,
      tappable: false,
      closedBuilder: closedBuilder,
      closedShape: closedShape,
      clipBehavior: Clip.none,
      closedElevation: closedElevation,
      openElevation: openElevation,
      closedColor: closedColor,
      openColor: openColor,
    );
  }
}

void showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {
  if (isMarkedAsDone ?? false) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
      content: Text('Marked as done!'),
    ));
  }
}
