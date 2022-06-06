import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/widget/button/answer_button.dart';
import 'package:flutter_full_learn/product/widget/button/loading_button.dart';
import 'package:flutter_full_learn/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallBackUser user){
            print(user.name);
          }),
          AnswerButton(
            onNumber: (int number){
              return number % 3 == 1;
            },
          ),
          LoadingButton(title: 'save', onPressed: () async {
            await Future.delayed(const Duration(seconds: 1));
          })
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final int id;

  CallBackUser(this.name, this.id);

  // TODO its Dummy when your work done, remove this
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser('hd', 123),
      CallBackUser('hd2', 124),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CallBackUser &&
      other.name == name &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
