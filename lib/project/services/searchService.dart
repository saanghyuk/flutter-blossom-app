import 'dart:convert';

import '../models/responseModel/resModel.dart';
import '../models/searchDataObject/searchModel.dart';
import '../modules/httpModule.dart';

class SearchService{
  Future<SearchWrapModel> search(String query) async {
    final HttpModuleResponseModel _res = await HttpModule.post(
        uri: "http://192.168.45.171:3000/search",
        body: SearchReqModel(searchQuery: "Flutter").encode(),
        headers : {"content-type": "application/json"});

    final Map<String, dynamic> _resBody = json.decode(_res.body);
    final ResModel _resModel = ResModel.SearchDataModel(_resBody);
    return _resModel.body as SearchWrapModel;
  }
}