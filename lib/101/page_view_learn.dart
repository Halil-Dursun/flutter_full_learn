import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20.0),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(onPressed: (){
            _pageController.previousPage(duration: DurationUtilty.durationLow, curve: Curves.slowMiddle);
          },child: Icon(Icons.chevron_left_outlined),),
          SizedBox(width: 5,),
          FloatingActionButton(onPressed: (){
            _pageController.nextPage(duration: DurationUtilty.durationLow, curve: Curves.slowMiddle);
          },child: Icon(Icons.chevron_right_outlined),),
        ],
      ),
      body: PageView(
        //controller: PageController(viewportFraction: 0.7),
        controller: _pageController,
        //padEnds: false,
        onPageChanged: _updatePageIndex,
        children: [
          IconLearnView(),
          const StackLearn(),
        ],
      ),
    );
  }
}

class DurationUtilty{
  static const Duration durationLow= Duration(seconds: 1);
}