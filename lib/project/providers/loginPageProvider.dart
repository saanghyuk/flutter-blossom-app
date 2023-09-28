import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/loginService.dart';


/// @TODO 자동로그인
final class LoginPageProvider with ChangeNotifier{
  final LoginServiceInterface _loginService = LoginService();


  bool _loginState = false;
  bool get loginState => this._loginState;

  // 독립적으로 프로바이더를 바라봤을때 --> 이래서 State를 전역 Provider로 따로 뺄까 라는 고민을 하게 된다.
  Future<bool> loginStateChange() async {
    /// 검증이 필요하다. 검증하는 로직은 또 서비스에 있어야 한다.
    final bool _check = await this._loginService.loginCheck();
    this._loginState = _check;
    this.notifyListeners();
    return _check;
  }


  /// Get / Set
  String errMsg = "";


  Future login({
        required String email,
        required String pwd,
        required Future<void> Function() onLogin,
        required Future<void> Function() onErr}) async {
          final _loginCheck = await _loginService.login(email: email, pwd: pwd);

          if(_loginCheck){
            this._loginState = true;
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