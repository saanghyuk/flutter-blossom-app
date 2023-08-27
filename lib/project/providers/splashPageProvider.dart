import 'dart:async';

import 'package:blossom/project/services/loginService.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageProvider with ChangeNotifier{

  // interface타입이여도 loginCheck부를 수 있다. 정의가 되있으면 부를 수 있다.
  final LoginServiceInterface _loginService = LoginService();

  Future<void> loginCheck({
    required FutureOr<void> Function() onDone,
    required FutureOr<void> Function() onErr,
  }) async {
    bool _loginCheck = await this._loginService.loginCheck();
    /// @TODO 서버 연결을 위해 테스트
    if(true){
      await onDone();
    } else{
      await onErr();
    }
  }
}