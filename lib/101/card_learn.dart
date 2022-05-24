import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            margin: ProjectMargin.cardMargin,
            color: Colors.white,
            child: SizedBox(height: 100,width: 300,child: Center(child: Text('Ali',style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.red),)),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}

class ProjectMargin{
  static const cardMargin = EdgeInsets.all(10);
}

//! Card ShapeBorder
//*RoundedRectangleBorder
//*StadiumBorder
//*CircleBorder

class _CustomCard extends StatelessWidget{
  final Widget child;

  const _CustomCard({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargin.cardMargin,
      child: child,
    );
  }

}