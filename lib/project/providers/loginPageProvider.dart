import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/loginService.dart';


/// @TODO 자동로그인
final class LoginPageProvider with ChangeNotifier{
  final LoginServiceInterface _loginService = LoginService();


  bool loginState = false;


  /// Get / Set
  String errMsg = "";


  Future login({
        required String email,
        required String pwd,
        required Future<void> Function() onLogin,
        required Future<void> Function() onErr}) async {
          final _loginCheck = await _loginService.login(email: email, pwd: pwd);

          if(_loginCheck){
            loginState = true;
            await onLogin();
          } else {
            // print("오류입니다.");
            this.errMsg = "오류입니다";
            /// this.notifyListner(); 필요가 없다.
            await onErr();
          // 팝업창 닫았다는 뜻.
            this.errMsg = "";
        }
    }
}