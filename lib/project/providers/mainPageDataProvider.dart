import 'dart:convert';
import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:flutter/foundation.dart';
import '../modules/httpModule.dart';


class MainPageDataProvider with ChangeNotifier{
  LoginPageProvider loginPageProvider;
  MainPageDataProvider({required this.loginPageProvider}){
    Future.microtask(this._init);
  }

  Future<void> _init() async {
    if(!loginPageProvider.loginState) return;
    /// @TODO login여부를 확인해서 실행
    final String _uri = "http://192.168.45.171:3000/main";
    /// body & statusCode
    final HttpModuleResponseModel _res = await HttpModule.post(uri: _uri);
    final Map<String, dynamic> _body = json.decode(_res.body);
    print(_body);
    ResModel.MainDataModel(_body)



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
}