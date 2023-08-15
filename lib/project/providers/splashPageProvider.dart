import 'dart:async';
import 'package:blossom/project/services/loginService.dart';
import 'package:flutter/foundation.dart';

class SplashPageProvider with ChangeNotifier{

  // interface타입이여도 loginCheck부를 수 있다. 정의가 되있으면 부를 수 있다.
  final LoginServiceInterface _loginService = LoginService();

  Future<void> loginCheck({
    required FutureOr<void> Function() onDone,
    required FutureOr<void> Function() onErr,
  }) async {
    ///
    // await Future.delayed(Duration(seconds: 3));
    // final _pref = await SharedPreferences.getInstance();
    // bool _loginCheck = _pref.getBool("loginCheck") ?? false;
    //

    bool _loginCheck = await this._loginService.loginCheck();
    if(_loginCheck){
      await onDone();
    }
    else {
      await onErr();
    }

  }
}