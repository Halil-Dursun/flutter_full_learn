import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';

import 'post_model.dart';

abstract class IPostService{
  Future<bool> addItemToService(PostModel model);
  Future<bool> updateItemToService(PostModel model,int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItems();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService{
  final Dio _dio;
  PostService()
      : _dio =
            Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(PostModel model) async {
    try {
      final response =
          await _dio.post(_PostServicePath.posts.name, data: model.toJson());
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
      return false;
  }
  @override
  Future<bool> updateItemToService(PostModel model,int id) async {
    try {
      final response =
          await _dio.put('${_PostServicePath.posts.name}/$id', data: model.toJson());
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
      return false;
  }
  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response =
          await _dio.delete('${_PostServicePath.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
      return false;
  }

  @override
  Future<List<PostModel>?> fetchPostItems() async {
    try {
      final response = await _dio.get('posts');
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }
  
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(_PostServicePath.comments.name,
      queryParameters: {_PostQueryServicePath.postId.name : postId}
      );
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error,this);
    }
    return null;
  }
}

enum _PostServicePath { posts, comments }
enum _PostQueryServicePath { postId }

class _ShowDebug{
  static void showDioError<T>(DioError error,T type){
    if(kDebugMode){
      print(error.message);
      print(type);
      print('-------');
    }
  }
}
