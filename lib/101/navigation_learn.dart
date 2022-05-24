import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/navigate_detail_page.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems =[];

  void addSelected(int index,bool isAdd){
    setState(() {
    isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
      },child: const Icon(Icons.navigate_next_outlined),),
      body: ListView.builder(itemBuilder: ((context, index) {
        return  InkWell(
          onTap: ()async{
          final result = await navigateToWidgetNormal<bool>(context, NavigateDetailPage(isOkey: selectedItems.contains(index),));
          if(result is bool){
            addSelected(index,result);
          }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Placeholder(
              color: selectedItems.contains(index) ? Colors.green : Colors.red,
            ),
          ),
        );
      })),
    );
  }
}

mixin NavigatorManager{
  void navigateToWidget(BuildContext context, Widget widget){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return widget;
          },fullscreenDialog: true,settings: RouteSettings()),);
  }

  Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget){
    return Navigator.of(context).push<T>(MaterialPageRoute(builder: (context){
            return widget;
          },fullscreenDialog: true,settings: RouteSettings()),);
  }
}