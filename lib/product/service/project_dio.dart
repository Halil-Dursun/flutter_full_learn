

import 'package:dio/dio.dart';

mixin ProjectDioMixin{
  final Dio service = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));
}