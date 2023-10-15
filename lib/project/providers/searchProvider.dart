import 'dart:convert';

import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:blossom/project/models/searchDataObject/searchModel.dart';
import 'package:blossom/project/services/searchService_Singleton.dart';
import 'package:flutter/widgets.dart';

import '../modules/httpModule.dart';
import '../services/searchService.dart';

/// 전역 프로바이더
final class SearchProvider_G with ChangeNotifier{
  List<String> _searchLogs = [];
  void setLog(String log){
    this._searchLogs.add(log);
    this.notifyListeners();
  }
}


/// 지역 프로바이더
final class SearchProvider with ChangeNotifier{
  /// 서버랑 주고받음
  /// 받은 걸로 !
  final QsModel model;
  final SearchService _searchService = SearchService_Singleton.getInstance();

  SearchProvider({required this.model}){
    print("Search");
    Future.microtask(_init);
  }

  Future _init() async {
    // this.model
    if(this.model.q == null) return;
    await this.search(this.model.q!);
  }

  Future search(String query) async {
    this.state = await _searchService.search(query);
    this.notifyListeners();
  }

  SearchWrapModel? state;
}
