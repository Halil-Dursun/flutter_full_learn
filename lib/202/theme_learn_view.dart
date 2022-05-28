import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/password_text_field.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({Key? key}) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  bool _value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PasswordTextField(),
          CheckboxListTile(
            title: const Text('Select'),
            value: _value, onChanged: (value){
              setState(() {
                _value = value!;
              });
          },)
        ],
      ),
    );
  }
}