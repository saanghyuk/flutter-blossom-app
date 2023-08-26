import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/loginService.dart';

final class LoginPageProvider with ChangeNotifier{
  final LoginServiceInterface _loginService = LoginService();
  Future login({
    required String email,
    required String pwd,
    required FutureOr<void> Function() onLogin,
    required FutureOr<void> Function() onErr,
  }) async {
      final bool _loginCheck = await _loginService.login(email: email, pwd: pwd);
      /// 오류가 났으면 무슨 오류인지, 무슨 오류인지에 따라서 화면의 종류도 바뀔 수 있는 것 까지 해줘야 한다.
      /// Err 메세지를 전달할 수 있게 추가 수정이 필요함. login함수의 반환값이 bool만으로는 안된다.
      if(_loginCheck){
          await onLogin();
      }else{
        await onErr();
      }
  }
}