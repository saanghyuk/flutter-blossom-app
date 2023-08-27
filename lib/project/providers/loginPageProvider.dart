import 'dart:async';
import 'package:flutter/foundation.dart';
import '../services/loginService.dart';

final class LoginPageProvider with ChangeNotifier{
  final LoginServiceInterface _loginService = LoginService();
  Future login({
      required String email,
      required String pwd,
      required Future<void> Function() onLogin,
      required Future<void> Function() onErr}) async{
    final _loginCheck = await _loginService.login(email: email, pwd: pwd);
          if(_loginCheck){
          await onLogin();
          } else{
          await onErr();
        }
    }
}