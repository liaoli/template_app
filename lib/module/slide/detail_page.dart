import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../extended_image/common/widget/hero.dart';

class DetailPage extends StatefulWidget {
  final int index;

  const DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  GlobalKey<ExtendedImageSlidePageState> slidePagekey =
      GlobalKey<ExtendedImageSlidePageState>();

  ValueNotifier<double> isSliding = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ExtendedImageSlidePage(
        key: slidePagekey,
        slideType: SlideType.onlyImage,
        slideAxis: SlideAxis.both,
        onSlidingPage: (state) {
          ///you can change other widgets' state on page as you want
          ///base on offset/isSliding etc
          //var offset= state.offset;

          debugPrint("offset --->${state.offset}");

          isSliding.value = state.offset.dy;
        },
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: isSliding,
                builder: (BuildContext context, double value, Widget? child) {
                  return Opacity(
                    opacity: value != 0  ? 0 : 1,
                    child: ListView(
                      children: [
                        ExtendedImage.network(
                          "https://pdimg.dot-st.com/images/globalwork/goods/itemImg12/125493/item_125493_main_08_b.jpg",
                          height: 500,
                          width: 600,
                          enableSlideOutPage: true,
                        ),
                      ],
                    ),
                  );
                }),
            HeroWidget(
              tag: widget.index,
              slideType: SlideType.onlyImage,
              slidePagekey: slidePagekey,
              child: ExtendedImage.network(
                "https://pdimg.dot-st.com/images/globalwork/goods/itemImg12/125493/item_125493_main_08_b.jpg",
                height: 500,
                width: 600,
                enableSlideOutPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
