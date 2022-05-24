import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardHeight = 80.0;
  final _cardWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: RandomImage(),
                    bottom: _cardHeight/2,
                  ),
                  Positioned(
                    child: _cardCustom(),
                    height: _cardHeight,
                    width: _cardWidth,
                    bottom: 0,
                  )
                ],
              ),
            ),
          ),
          Spacer(flex: 6,),
        ],
      ),
    );
  }

  Card _cardCustom() {
    return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    color: Colors.white,
                  );
  }
}
