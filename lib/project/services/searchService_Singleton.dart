

import 'package:blossom/project/services/searchService.dart';

class SearchService_Singleton{

  // 기본 생성 막기
  SearchService_Singleton._();

  static SearchService? _service;

  static SearchService getInstance(){
    if(_service == null){
      _service = SearchService();
    }
    return _service!;
  }
}