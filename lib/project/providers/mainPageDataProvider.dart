import 'dart:convert';
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
    final HttpModuleResponseModel _res = await HttpModule.post(uri: _uri, headers: {});
    print(_res.body);
    Map<String, dynamic> _body = json.decode(_res.body);
  }
}