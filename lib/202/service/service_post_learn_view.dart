import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  List<PostModel>? _items;
  bool _isLoading = false;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';
  late final Dio _networkManager;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    _networkManager = Dio(BaseOptions(baseUrl: _baseUrl));
    super.initState();
  }
    void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel model)async{
    _changeLoading();
    final response = await _networkManager.post('posts',data: model.toJson());
    if(response.statusCode == HttpStatus.created){
      name = 'Başarılı';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink(),
        ],
        title: Text(name ?? 'noname'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: _bodyController,
            decoration: const InputDecoration(
              labelText: 'Body',
            ),
          ),
          TextField(
            textInputAction: TextInputAction.done,
            controller: _userIdController,
            autofillHints: const [AutofillHints.creditCardNumber],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'UserId',
            ),
          ),
          TextButton(
            onPressed: _isLoading ? null : () {
              if (_titleController.text.isNotEmpty &&
                  _bodyController.text.isNotEmpty &&
                  _userIdController.text.isNotEmpty) {
                    final model = PostModel(
                      body:  _bodyController.text,
                      title: _titleController.text,
                      userId: int.tryParse(_userIdController.text),
                    );
                    _addItemToService(model);
                  }
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
