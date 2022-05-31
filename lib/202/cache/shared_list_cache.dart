import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_cache_learn.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';


class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStateful<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List<User> userList =[];

  @override
  void initState() {
    super.initState();
    initializeAndSave();
  }

  void initializeAndSave() async{
    changeLoading();
    final SharedManager manager = SharedManager();
    userCacheManager = UserCacheManager(manager);
    manager.init();
    userList = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor,) : null,
        actions: isLoading ? null : [
          IconButton(onPressed: (){
            changeLoading();
            userCacheManager.saveItems(userList);
            changeLoading();
          }, icon: const Icon(Icons.download_for_offline_outlined),),
          IconButton(onPressed: (){
            print(userCacheManager.getItems()![0].name ?? '');
          }, icon: const Icon(Icons.remove_circle_outline,),)

        ],
      ),
      body: _UserListView(userList: userList,),
    );
  }
}
class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
    required this.userList
  }) : super(key: key);
  List<User> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context,index){
      return Card(
        child: ListTile(
          title: Text(userList[index].name ?? ''),
          subtitle: Text(userList[index].description ?? ''),
          trailing: Text(userList[index].url ?? '',style: Theme.of(context).textTheme.subtitle1?.copyWith(decoration: TextDecoration.underline),)
        ),
      );
    });
  }
}