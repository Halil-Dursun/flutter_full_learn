import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/image_learn_202.dart';
import 'package:flutter_full_learn/303/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/303/reqres_resource/viewModel/reqres_view_model.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifier.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

import '../model/resource_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({Key? key}) : super(key: key);

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

//class _ReqresViewState extends ReqresViewModel {
class _ReqresViewState extends State<ReqresView> with ProjectDioMixin{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) => ReqresProvider(ReqresService(service)),
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
            context.read<ThemeNotifier>().changeTheme();
          }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          actions: [
            ElevatedButton(onPressed: (){
              context.read<ReqresProvider>().saveToLocale(context.read<ResourceContext>());
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return ImageLearn202();
              }));
            }, child: const Icon(Icons.account_balance_wallet_outlined))
          ],
          title: context.watch<ReqresProvider>().isLoading ? const CircularProgressIndicator(color: Colors.white,) : null,
        ),
        body: Column(
          children: [
            Selector<ReqresProvider,bool>(builder: (context, value, child) {
              return value ? const Placeholder() : const Text('data');
            }, selector: (context,provider){
              return provider.isLoading;
            }),
            Expanded(child: _resourceListView(context,context.watch<ReqresProvider>().resources)),
          ],
        ),
      );
      } ,
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
        itemCount: context.watch<ReqresProvider>().resources.length,
        itemBuilder: (BuildContext context, int index) {
          inspect(items[index]);
          return Card(
            color: Color(items[index].color?.colorValue ?? 0),
              child: Text(
            items[index].name ?? '',
          ));
        },
      );
  }
}
