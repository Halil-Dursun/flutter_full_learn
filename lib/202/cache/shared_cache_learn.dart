import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/cache/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({Key? key}) : super(key: key);

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStateful<SharedLearn> {
  int _currentValue =0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _manager.init();
    userItems = UserItems().userList;
    getDefaultValues();
  }
Future<void> getDefaultValues() async{
  changeLoading();
  _onChangeValue(_manager.getString(SharedPrefKey.counter) ?? '');
  changeLoading();
}

  void _onChangeValue(String value){
    final _value = int.tryParse(value);
    if(_value != null){
      setState(() {
        _currentValue = _value;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      appBar: AppBar(
        actions: [
          _loading(context, isLoading),
        ],
        title: Text(_currentValue.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(onPressed: () async{
      changeLoading();
      _manager.saveString(SharedPrefKey.counter,_currentValue.toString());
      changeLoading(); 
    },child: const Icon(Icons.save),);
  }
    FloatingActionButton _removeValueButton() {
    return FloatingActionButton(onPressed: () async{
      changeLoading();
      _manager.removeItem(SharedPrefKey.counter);
      changeLoading();
    },child: const Icon(Icons.remove),);
  }
}



Widget _loading(BuildContext context,bool isLoading){
  return isLoading ? Center(
            child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor,),
          ) : const SizedBox.shrink();
}




class UserItems{
  late final List<User> userList;

  UserItems(){
    userList = [
      User('Halil', 'Dursun', 'hd.dev'),
      User('Halil1', 'Dursun1', 'hd1.dev'),
      User('Halil2', 'Dursun2', 'hd2.dev'),
      User('Halil3', 'Dursun3', 'hd3.dev'),
    ];
  }
}

//Generic
abstract class LoadingStateful<T extends StatefulWidget> extends State<T>{

  bool isLoading = false;

  void changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }
}