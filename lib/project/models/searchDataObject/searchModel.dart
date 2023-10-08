
import 'dart:convert';

import 'package:blossom/project/models/responseModel/resBodyModel.dart';

class SearchModel{
  final String id;
  final String title;
  final String imgSrc;
  const SearchModel({required this.id, required this.title, required this.imgSrc});

  SearchModel.json(Map<String, dynamic> json): id=json['id'], title = json['title'], imgSrc = json['imgSrc'];

}


class SearchWrapModel implements ResBodyModel{
  final List<SearchModel> searchModels;
  SearchWrapModel({required this.searchModels});
  factory SearchWrapModel.json(List json){
    return SearchWrapModel(
      searchModels: json.map<SearchModel>((e) => SearchModel.json(e)).toList()
    );
  }
}

class SearchReqModel{
  final String searchQuery;
  const SearchReqModel({required this.searchQuery});
  Map<String, String> toMap() => {
    "q": this.searchQuery
  };
  String encode() => json.encode(this.toMap());
}