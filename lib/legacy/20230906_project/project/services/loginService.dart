import 'dart:convert';

import 'package:blossom/project/models/authDataObject/autoModel.dart';
import 'package:blossom/project/modules/httpModule/httpModule.dart';
import 'package:blossom/project/modules/localDB.dart';

abstract interface class LoginServiceInterface{
  Future<bool> loginCheck();
  Future<bool> login({required String email, required String pwd});
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

  @override
  Future<bool> login({required String email, required String pwd}) async {
    // TODO: implement login
    /// HttpModule.post()
    /// pwd 암호화
    final HttpModuleResponseModel _res = await HttpModule.post(
      uri: "http://192.168.45.171:3000/auth",
      headers: {"content-type": "application/json"},
      body: json.encode(AuthSignInModel(
              email: email,
              password: pwd
              ).toMap()
    ));


    /// Decode하면 다트에서는 Map으로 바뀐다.
    Map<String, dynamic> _result = json.decode(_res.body);
    /// 이제 조건문이 들어가야 한다. 왜냐면, invalid한 경우도 있고 오류가 별게 다 있을 테니깐.
    print(_result);
    final AuthSignInResponseModel _userData = AuthSignInResponseModel.json(json:_result);
    /// LocalDB에 토큰 저장
    return true;
  }
}