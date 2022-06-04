import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({Key? key}) : super(key: key);

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

class _SecureContextLearnState extends State<SecureContextLearn> {
  String _title = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }
  Future<void> getSecureItems() async{
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    if(_title.isNotEmpty){
      print('adam daha önceden bu app i kullanmış');
      _controller.text = _title;
    }
    setState(() {
      
    });
  }
  void saveItems(String data){
    setState(() {
      _title = data;
    });
  }
  final _storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()async {
        await _storage.write(key: _SecureKeys.token.name, value: _title);
      }, label: const Text('save'),),
      body: TextField(
        controller: _controller,
        onChanged: saveItems,
      ),
    );
  }
}

enum _SecureKeys{
  token
}
