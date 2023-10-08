import 'package:blossom/project/models/responseModel/resBodyModel.dart';

/// code, body 갖고 body를 Auth, Main, ...가질 수 있게.
/// AuthResponseModel도 이거 쓰면 된다.
final class ResModel{
  final int code;
  /// 하위 타입으로 잡을 때 as 들어가야 된다... 그거 안하려고 제네릭 하면 또 복잡해 진다.
  /// 그래서 implements?
  final ResBodyModel body;
  const ResModel._({required this.code, required this.body});
  ResModel.MainDataModel(Map<String, dynamic> json)
      :code = json['code'],
       body = ResBodyModel.MainDataModel(json['body']);

  ResModel.SearchDataModel(Map<String, dynamic> json)
      :code = json['code'],
        body = ResBodyModel.SearchModel(json['body']);

}



