import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const[
           CenterCircularRedProgress(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(),
          CenterCircularRedProgress(),
        ],
      ),
    );
  }
}

class CenterCircularRedProgress extends StatelessWidget {
  const CenterCircularRedProgress({Key? key}) : super(key: key);
  final Color redColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 1,
      value: 0.9,
      backgroundColor: Colors.white,
    ));
  }
}
