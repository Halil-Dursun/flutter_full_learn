import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            top: 20,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
            bottom: 100,
            height: 100,
            width: 100,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
