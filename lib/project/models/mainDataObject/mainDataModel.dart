import 'package:blossom/project/models/responseModel/resBodyModel.dart';
import 'package:blossom/project/modules/LanParserModule.dart';


/// 클래스 쓸 때 왠만하면 다 final을 붙이는게 좋다.
/// 클래스 extends가 안되게
final class MainDataModel implements ResBodyModel{
  final Lan lan; /// @
  final String id;
  final String c_date;
  final MainDataTitleModel title;
  final MainDataDesModel des;
  final String f_count;
  final String s_count;
  final String active;
  final String a_date;
  const MainDataModel({
    required this.lan,
    required this.id,
    required this.c_date,
    required this.title,
    required this.des,
    required this.f_count,
    required this.s_count,
    required this.active,
    required this.a_date
  });
  factory MainDataModel.json(Map<String, dynamic> body){
    return MainDataModel(
        lan: LanParserModule.stringToLen(body["lan"]),
        id: body['id'],
        c_date: body['c_date'],
        title: MainDataTitleModel.json(body['title']), /// @객체
        des: MainDataDesModel.json(body['des']), /// @객체
        f_count: body['f_count'],
        s_count: body['s_count'],
        active: body['active'],
        a_date: body['a_date']
    );
  }
}


final class MainDataTitleModel{
  final String txt;
  final String image;
  final String subTitle;
  const MainDataTitleModel({required this.txt, required this.image, required this.subTitle});
  MainDataTitleModel.json(Map<String, dynamic> body):
      txt = body['txt'],
      image = body['image'],
      subTitle = body['subTitle'];
}

enum DesType{
  Txt,
  Image,
  Video,
  TnI,
  TnV,
  Err
}

final class MainDataDesParser{
  static DesType parser(String type){
  if(type =="Txt" || type == "txt") return DesType.Txt;
  if(type =="video") return DesType.Video;
  if(type =="image") return DesType.Image;
  if(type.toUpperCase() == "TNV") return DesType.TnV;
  if(type.toLowerCase() == "tni") return DesType.TnI;
  return DesType.Err;
  }

}


final class MainDataDesModel{
  final String des;
  final List<String> images;
  final DesType type;
  const MainDataDesModel({required this.des, required this.images, required this.type});

  /// initializer도 자체 메서드도 못쓴다.(아직 객체가 안만들어졌다)
  /// 근데 factory도 자체 메서드는 못쓴다.
  factory MainDataDesModel.json(Map<String, dynamic> body){
    return MainDataDesModel(
        des: body['des'],
        images: body['images'],
        type: MainDataDesParser.parser(body['type'])
    );

}




