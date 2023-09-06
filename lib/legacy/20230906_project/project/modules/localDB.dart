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

  void close(){
    LocalDB._preferences = null;
    LocalDB._localDB = null;
}

}