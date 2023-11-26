import 'dart:convert';

import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:blossom/project/models/searchDataObject/searchModel.dart';
import 'package:blossom/project/services/searchService.dart';
import 'package:blossom/project/services/searchService_Singleton.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SearchStateModel_G{
  final List<String> searchLogs;
  const SearchStateModel_G({List<String>? searchLogs}) : searchLogs =searchLogs ?? const [];
}

/// 전역 프로바이더
final class SearchNotifier_G extends StateNotifier<SearchStateModel_G>{

  SearchNotifier_G(super.state);

  void setLog(String log){
    this.state = SearchStateModel_G(
      searchLogs: [...this.state.searchLogs, log]
    );
  }
}


class SearchStateModel{
  final QsModel model;
  final SearchWrapModel? state;
  const SearchStateModel({required this.model, this.state});
}
/// 지역 프로바이더
final class SearchNotifier extends StateNotifier<SearchStateModel>{

  final SearchService _searchService = SearchService_Singleton.getInstance();

  SearchNotifier(super.state){
    print("Search");
    Future.microtask(_init);
  }

  Future _init() async {
    // this.model
    if(this.state.model.q == null) return;
    await this.search(this.state.model.q!);
  }

  Future search(String query) async {
    // SearchWrapModel을 return 그 안에는 searchModel들이 쭉 있다.
    this.state = SearchStateModel(
        model: this.state.model,
      state: await _searchService.search(query)
    );
  }
}


final searchRiverpod_G = StateNotifierProvider<SearchNotifier_G, SearchStateModel_G>(
        (ref) => SearchNotifier_G(SearchStateModel_G())
);


/// @TODO: 나중에 이동할 때 또는 페이지가 나타날 때 QS를 받도록
final searchRiverpod = StateNotifierProvider<SearchNotifier, SearchStateModel>(
        (ref) => SearchNotifier(SearchStateModel(model: QsModel()))
);