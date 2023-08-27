import 'package:blossom/legacy/project_20230826/modules/httpModule.dart';
import 'package:flutter/foundation.dart';


class MainPageDataProvider with ChangeNotifier{
  MainPageDataProvider(){
    Future.microtask(this._init);
  }

  Future<void> _init() async {
    final String _uri = "http://192.168.45.171:3000/main";
    final HttpModuleResponseModel _res = await HttpModule.post(uri: _uri, headers: {});
    print(_res.body);
  }
}