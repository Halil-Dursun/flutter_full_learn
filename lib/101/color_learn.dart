import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Learn'),
      ),
      body: Container(
        child: Text('data',style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).errorColor),),
      ),
    );
  }
}

class ColorItems{
  static const Color porsche = Color(0xffEDBF61);
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
}