

import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';
import 'package:blossom/project/models/searchDataObject/searchModel.dart';


abstract class ResBodyModel{
  factory ResBodyModel.MainDataModel(List body){
    // return MainDataModel.json(body);
    return MainDataWrapModel.json(body);
}

  factory ResBodyModel.SearchModel(List body){
    // return MainDataModel.json(body);
    return SearchWrapModel.json(body);
  }
}