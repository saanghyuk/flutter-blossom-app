

import 'package:blossom/project/modules/localDB.dart';

abstract interface class LoginServiceInterface{
  Future<bool> loginCheck();
}

final class LoginService implements LoginServiceInterface{
 static const String _LOGIN_CHECK_KEY = "login_check";

 @override
  Future<bool> loginCheck() async {
    // TODO: implement loginCheck
    await Future.delayed(Duration(seconds: 3));
    final LocalDB _localDB = await LocalDB.instance();
    return _localDB.getBool(_LOGIN_CHECK_KEY) ?? false;
  }
}