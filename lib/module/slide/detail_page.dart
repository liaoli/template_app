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

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ExtendedImageSlidePage(
          key: slidePagekey,
          slideType: SlideType.onlyImage,
          slideAxis: SlideAxis.both,
          child: Stack(
            children: [
              // ListView(
              //   children: [
              //     ExtendedImage.network(
              //       "https://pdimg.dot-st.com/images/globalwork/goods/itemImg12/125493/item_125493_main_08_b.jpg",
              //       height: 500,
              //       width: 600,
              //       enableSlideOutPage: true,
              //     ),
              //   ],
              // ),
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
          )),
    );
  }
}
