import 'package:flutter/material.dart';

class GestureHeroList extends StatefulWidget {
  const GestureHeroList({Key? key}) : super(key: key);

  @override
  State<GestureHeroList> createState() => _GestureHeroListState();
}

class _GestureHeroListState extends State<GestureHeroList>
    with TickerProviderStateMixin {
  var _games = [
    "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
    "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
    "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
    "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: createItemView(index),
              onTap: () {
                // Get.to(() => TodoListPage());
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10,
            );
          },
          itemCount: _games.length),
    );
  }

  Widget createItemView(int index) {
    var game = _games[index]; // 获取数据
    // 定义动画控制器
    var _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    // 定义动画
    var _animation =
        Tween<double>(begin: 1, end: 0.98).animate(_animationController);
    return GestureDetector(
      onPanDown: (details) {
        print('onPanDown');
        _animationController.forward(); // 点击的时候播放动画
      },

      onVerticalDragStart: (details){
        print('onVerticalDragStart');
      },

      onVerticalDragDown:  (details){
        print('onVerticalDragDown');
      },

      onPanCancel: () {
        print('onPanCancel');
        _animationController.reverse(); // cancel的时候回弹动画
      },
      child: Container(
        height: 450,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ScaleTransition(
          scale: _animation, // 定义动画
          child: Hero(
            tag: "game$index",
            child: Stack(
              // 圆角图片为背景，上面为text
              children: <Widget>[
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      game,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "game.headText",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          " game.title",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        "game.footerText",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "game$index", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.network(
          "https://www.dot-st.com/static/docs/elura/keyvisual/images/el_main_230215_kiku43.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
