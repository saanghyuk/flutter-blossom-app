import 'dart:convert';
import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';
import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/services/mainService.dart';
import 'package:flutter/foundation.dart';
import '../modules/httpModule.dart';


class MainPageDataProvider with ChangeNotifier {
  LoginPageProvider loginPageProvider;
  final MainService _mainService = MainService();
  MainPageDataProvider({required this.loginPageProvider}){
    Future.microtask(this._init);
  }

  MainDataWrapModel? _data;
  MainDataWrapModel? get data => this._data;

  Future<void> _init() async {
    if(!loginPageProvider.loginState) return;
    this.fetch();
    notifyListeners();

    /// 1 MainModel이 나올 거라고 확정을 지어 놓은 것.
     /// ResModel.MainModel(body)의 body 를 빼서 as MainPageResponseModel
    /// 2
    // ResModel(
    //   code: _body['code'],
    //   body: MainDataResponseModel.json(_body["body"])
    // )
    /// 의 body 를 빼서 as MainPageResponseModel
    /// 3
    ///  ResModel.json(_body);
    /// 의 body 를 빼서 as MainPageResponseModel
  }
  void clear(){
    this._data= null;
    this.notifyListeners();
  }

  Future<void> fetch() async {
    final ResModel _data = await this._mainService.fetch();
    this._data = _data.body as MainDataWrapModel;
    this.notifyListeners();
  }
}