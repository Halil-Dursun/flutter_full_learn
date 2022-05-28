import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/package/launch_manager.dart';
import 'package:flutter_full_learn/202/package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView>
    with TickerProviderStateMixin, LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        slaunchUrl('https://pub.dev/packages/url_launcher');
      },
      backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
      ),
      appBar: AppBar(
      ),
      body: Column(
        children: [
          Text('data',style: Theme.of(context).textTheme.subtitle1,),
          LoadingBar(),
        ],
      ),
    );
  }
}
