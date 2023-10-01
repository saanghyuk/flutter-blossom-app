

import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';


abstract class ResBodyModel{
  factory ResBodyModel.MainDataModel(List body){
    // return MainDataModel.json(body);
    return MainDataWrapModel.json(body);
  }
}