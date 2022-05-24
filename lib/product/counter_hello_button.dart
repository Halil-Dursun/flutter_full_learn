import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({ Key? key }) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      _updateCounter();
    }, child: Text("${LanguageItems.welcomeTitle} $_counterCustom"));
  }

  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }
}