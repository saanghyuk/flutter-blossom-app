

import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';

abstract class ResBodyModel{
  factory ResBodyModel.MainDataModel(Map<String, dynamic> body){
    return MainDataModel.json(body);
  }
}