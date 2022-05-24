import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.red,),),
                Expanded(child: Container(color: Colors.green,),),
                Expanded(child: Container(color: Colors.yellow,),),
                Expanded(child: Container(color: Colors.pink,),),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('a1'),
                Text('a2'),
                Text('a3'),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: const FlutterLogo(),
          ),
          Expanded(
            flex: 3,
            child: const FlutterLogo(),
          ),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Spacer(),
                Expanded(child: Text('data')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSizes{
  static const double cardHeight = 200;
}
