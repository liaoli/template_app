import 'package:flutter/material.dart';

class StateButton extends StatefulWidget {
  const StateButton({Key? key}) : super(key: key);

  @override
  State<StateButton> createState() => _StateButtonState();
}

class _StateButtonState extends State<StateButton> {
  ValueNotifier<bool> highlightNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: const [Colors.red, Colors.red]),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onHighlightChanged: (bool highlight) {
            highlightNotifier.value = highlight;
          },
          highlightColor: Colors.green,
          splashFactory: NoSplash.splashFactory,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: SizedBox(
            width: 72,
            height: 24,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: highlightNotifier,
                builder: (BuildContext context,bool value, Widget? child) {
                  return Text(
                    '立即购买',
                    style: TextStyle(
                      color: value?Colors.black: Colors.white,
                      fontSize: 12,
                    ),
                  );
                },
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
