
// abstract가 추상으로 가능하게 해주는 키워드. 인터페이스는

import 'package:blossom/project/modules/localDB.dart';

abstract interface class LoginServiceInterface{
  Future<bool> loginCheck();

}
// 최소한
final class LoginService implements LoginServiceInterface{

  static const String _LOGIN_CHECK_KEY = "login_check";

  @override
  Future<bool> loginCheck() async {
    // TODO: implement loginCheck
    await Future.delayed(Duration(seconds: 3));
    final LocalDB _localDB = await LocalDB.instance();
    return _localDB.getBool(_LOGIN_CHECK_KEY) ?? false;
  }


  // await Future.delayed(Duration(seconds: 3));
  // final _pref = await SharedPreferences.getInstance();
  // bool _loginCheck = _pref.getBool("loginCheck") ?? false;

}