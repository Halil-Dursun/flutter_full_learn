import 'package:flutter/material.dart';

class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;
  PostModel4({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

class PostModel5 {
  int _userId;
  int _id;
  String _title;
  String _body;

  int get userId => _userId;

  PostModel5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
  // {
  //   _userId = userId;
  //   _id = id;
  //   _title = title;
  //   _body = body;
  // }
}

class PostModel6 {
  late int _userId;
  late int _id;
  late String _title;
  late String _body;

  String get title => _title;

  PostModel6(
      {required int userId,
      required int id,
      required String title,
      required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel7 {
  late int _userId;
  late int _id;
  late String _title;
  late String _body;

  PostModel7(
      {int userId = 0, int id = 0, String title = '', String body = ''}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data){
    if(data !=null && data.isNotEmpty){
      body = data;
    }
  }

  PostModel8 copyWith({
  final int? userId,
  final int? id,
  final String? title,
  final String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }


}
