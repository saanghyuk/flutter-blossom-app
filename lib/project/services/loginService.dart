import 'dart:convert';
import 'package:blossom/project/models/authDataObject/authResponseModel.dart';
import 'package:blossom/project/modules/httpModule.dart';
import 'package:blossom/project/modules/localDB.dart';

import '../models/authDataObject/authModel.dart';

abstract interface class LoginServiceInterface{
  Future<bool> loginCheck();
  Future<bool> login({required String email, required String pwd});
}

final class LoginService implements LoginServiceInterface{
 static const String _LOGIN_CHECK_KEY = "login_check";

 static const String login_key = "login";
 static const String token_key = "token";
 static const String refreshToken_key = "refreshToken";
 static const String expiresIn_key = "expiresIn";
 static const String email_key = "email";
 static const String displayName_key = "displayName";

 @override
  Future<bool> loginCheck() async {
    // TODO: implement loginCheck
    await Future.delayed(Duration(seconds: 3));
    final LocalDB _localDB = await LocalDB.instance();
    return _localDB.getBool(_LOGIN_CHECK_KEY) ?? false;
  }

  /// Firebase Login함수 구현
  @override
  Future<bool> login({required String email, required String pwd})  async {
          final _body = json.encode(
          AuthSignInModel(email: email, password: base64Encode(pwd.codeUnits)).toMap()
        );

          // print(_body);
          // throw "stop";

          final HttpModuleResponseModel _res = await HttpModule.post(
                uri: "http://192.168.45.171:3000/auth",
                headers: {"content-type": "application/json"},
                body: _body );

          final Map<String, dynamic> _result = json.decode(_res.body);

          // 오류 확인
          AuthResponseModel model = AuthResponseModel.json(_result);

          final _firebaseModel = model.body as FirebaseAuthDataModel;
          if(model.code == 200){
              final _okModel = _firebaseModel as FirebaseAuthDataOkModel;
              // final AuthSignInResponseModel _userData = AuthSignInResponseModel.json(json:_result);

              LocalDB _db = await LocalDB.instance();
              /// 로그인을 정상적으로 성공 했는지
              // await _db.setBool("login", true);
              // await _db.setString("token", _okModel.idToken);
              // await _db.setString("token", _okModel.refreshToken);
              // await _db.setString("token", _okModel.expiresIn);
              // await _db.setString("token", _okModel.email);
              // await _db.setString("token", _okModel.displayName);
              await _db.setDatas({
                  login_key : true,
                  token_key: _okModel.idToken,
                  refreshToken_key : _okModel.refreshToken,
                  expiresIn_key: _okModel.expiresIn,
                  email_key : _okModel.email,
                  displayName_key: _okModel.displayName
});

              return true;
          } else{
              final _errModel = _firebaseModel as FirebaseAuthDataErrModel;

              return false;
          }




  }
}