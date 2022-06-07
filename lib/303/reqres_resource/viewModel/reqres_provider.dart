
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';

import '../model/resource_model.dart';
import '../service/reqres_service.dart';

class ReqresProvider extends ChangeNotifier{
late final IReqresService _reqresService;
bool isLoading =false;
List<Data> resources = [];

void _changeLoading(){
  isLoading = !isLoading;
  notifyListeners();
}

  ReqresProvider(this._reqresService){
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = (await _reqresService.fetchResourceItem())?.data ?? [];
    _changeLoading();
  }

  void saveToLocale(ResourceContext resourceContext){
    resourceContext.saveModel(ResourceModel(data: resources));
  }
}