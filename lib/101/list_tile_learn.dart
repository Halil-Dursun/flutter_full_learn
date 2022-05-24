import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  final String listTileTitle = "My Card";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Card(
          child: ListTile(
            title: RandomImage(),
            //dense:true,
            //contentPadding: EdgeInsets.zero,// -> material app -> themedata ->  listTileTheme
            tileColor: _Colors().tileColor,
            onTap: (){},
            subtitle: Text('How do you use your card'),
            leading: Container(alignment: Alignment.bottomRight,height: 60,width: 30,color: Colors.red,child: Icon(Icons.money)),
            trailing: Icon(Icons.chevron_right),
          ),
        )
      ]),
    );
  }
}

class _Colors{
  final Color tileColor = Colors.red.shade200;
}
