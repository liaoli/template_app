import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text(
            "main page",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {

          },
        ),
      ),
    );
  }
}
