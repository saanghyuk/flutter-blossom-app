


import 'dart:convert';

import 'package:blossom/project/models/responseModel/resModel.dart';
import 'package:blossom/project/modules/httpModule/httpModule.dart';

final class MainService{
  Future<ResModel> fetch() async {
    /// @TODO login여부를 확인해서 실행
    final String _uri = "http://192.168.45.171:3000/main";
    /// body & statusCode
    final HttpModuleResponseModel _res = await HttpModule.post(uri: _uri);
    final Map<String, dynamic> _body = json.decode(_res.body);
    // print(_body);
    return ResModel.MainDataModel(_body);
  }
}