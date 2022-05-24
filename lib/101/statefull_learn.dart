import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/counter_hello_button.dart';
import 'package:flutter_full_learn/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.welcomeTitle),
        actions: [
          Text(
            '$_index',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _incrementCounter(),
          _decrementCounter(),
        ],
      ),

      body: Column(
        children: [
          const Placeholder(),
          Center(child: Text(_index.toString(),style: Theme.of(context).textTheme.headline2,),),
          CounterHelloButton(),
        ],
      ),
    );
  }

  Padding _decrementCounter() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: Icon(
          Icons.remove,
        ),
      ),
    );
  }

  FloatingActionButton _incrementCounter() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
        
      },
      child: Icon(
        Icons.add,
      ),
    );
  }

  void _updateCounter(bool isIncrement){
    if (isIncrement) {
      _index++;
    } else {
      _index--;
    }
    setState(() {});
  }
}
