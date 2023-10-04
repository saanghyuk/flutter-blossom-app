import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:flutter/widgets.dart';

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
  SearchProvider({required this.model}){
    Future.microtask(_init);
  }

  Future _init() async {
    // this.model
    if(this.model.q == null){

    }
  }

}