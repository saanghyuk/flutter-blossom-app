import 'dart:convert';

import 'package:blossom/project/services/loginService.dart';
import 'package:shared_preferences/shared_preferences.dart';


final class LocalDB{

  LocalDB._();

  static SharedPreferences? _preferences;
  static LocalDB? _localDB;
  static Future<LocalDB> instance() async {
    if(_localDB == null){
      _localDB = LocalDB._();
      _preferences = await SharedPreferences.getInstance();
    }
    return _localDB!;
    }


  bool? getBool(String key){
    //Future.delayed(Duration(seconds:3));
    if(LocalDB._localDB == null || LocalDB._preferences == null){
        throw "instance() 이걸로 다시 만들어서 쓰세요. close하면 다시 만들어야 합니다";
    }
    return LocalDB._preferences!.getBool(key);
  }

  /// 싱글톤
  Future<bool> setBool(String key, bool value) async {
    if(_preferences == null ) throw "생성 필요";
    return await _preferences!.setBool(key, value);
  }

  void close(){
    LocalDB._preferences = null;
    LocalDB._localDB = null;
    }



    Future<Map<String, dynamic>> getDatas(String key) async {

    if(_preferences == null ) throw "생성 필요";
      /// loginCheck일때 key는 "userData"
      final String? _userDataString = _preferences!.getString(key);
      return _userDataString == null ? {} : json.decode(_userDataString);
    }

    Future<bool> setDatas(String key, Map<String, dynamic> datas) async {
        /// @ TODO
        // for(int i = 0; i < datas.length; i++){}
        // datas.forEach((String key, dynamic value) {
        //     if(value.runtimeType == int){
        //
        //     } else if(value.runtimeType == String){
        //
        //     } else if(value.runtimeType == double){
        //
        //     } else if(value.runtimeType == bool){
        //
        //     } else {
        //       throw "Type Error";
        //     }
        // });
        final String _encodeData = json.encode(datas);
        final _save_result = await _preferences!.setString(key, _encodeData);
        if(!_save_result) throw "_save_result ERR";

        return _save_result;
    }

}