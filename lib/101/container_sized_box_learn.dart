import 'package:flutter/material.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container and SizedBox'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 300,
            child: Text('a' * 450),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 100,
            child: Text('b' * 50),
          ),
          Container(
            height: 50,
            width: 50,
            constraints: const BoxConstraints(
                maxWidth: 150, minWidth: 100, maxHeight: 100),
            child: Text('aa' * 10),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,//ProjectContainerDecoration(),
          ),
        ],
      ),
    );
  }
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
          color: Colors.red,
          gradient: LinearGradient(colors: [Colors.red, Colors.black]),
          borderRadius: BorderRadius.circular(10),
          //!border: Border.all(width: 2,color: Colors.white)
          boxShadow: [
            BoxShadow(
                color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
          ],
        );
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.red,
    gradient: LinearGradient(colors: [Colors.red, Colors.black]),
    borderRadius: BorderRadius.circular(10),
    //!border: Border.all(width: 2,color: Colors.white)
    boxShadow: [
      BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
    ],
  );
}
