import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_learn.dart';
import 'package:flutter_full_learn/303/feed_view.dart';

class TabAdvanceLearn extends StatefulWidget {
  const TabAdvanceLearn({Key? key}) : super(key: key);

  @override
  State<TabAdvanceLearn> createState() => _TabAdvanceLearnState();
}

class _TabAdvanceLearnState extends State<TabAdvanceLearn> with TickerProviderStateMixin{
  late final TabController _tabController;
  final double _notchedValue = 10.0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton(onPressed: (){
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          child:  _myTab(),
        ),
        appBar: AppBar(
          // bottom: const TabBar(tabs: [
          //   Tab(text: 'Page 1',),
          //   Tab(text: 'Page 2',),
          // ],
          // ),
        ),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTab() {
    return TabBar(
          onTap: (int index){},
          controller: _tabController,
          tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name.toUpperCase()}',)).toList(),
        
        );
  }

  TabBarView _tabbarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
        const ImageLearn(),
        const FeedView(),
        IconLearnView(),
        IconLearnView(),
      ]);
  }
}

enum _MyTabViews {
  home,settings,favorite,profile
}

extension _MyTabViewExtension on _MyTabViews{

}