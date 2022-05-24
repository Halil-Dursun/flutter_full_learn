import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/container_sized_box_learn.dart';

class ScaffoldLearn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold sampless'),
      ),
      body: Text('merhaba'),
      backgroundColor: Colors.red,
      drawer: const Drawer(),
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) => Container(height: 200,));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //bottomSheet: const Text('sheet'),
      bottomNavigationBar: Container(
        height: 200,
        decoration: ProjectContainerDecoration(),
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc_sharp,),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.outbond_outlined,),label: 'person'),
        ]),
      ),
    );
  }

}