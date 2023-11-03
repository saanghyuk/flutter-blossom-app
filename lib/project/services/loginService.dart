import 'dart:convert';
import 'package:blossom/project/env.dart';
import 'package:blossom/project/models/authDataObject/authResponseModel.dart';
import 'package:blossom/project/modules/httpModule/httpModule_exports.dart';
import 'package:blossom/project/modules/httpModule/httpModule_interface.dart';
import 'package:blossom/project/modules/localDB.dart';

import '../models/authDataObject/authModel.dart';

abstract interface class LoginServiceInterface{
  Future<bool> loginCheck();
  Future<bool> login({required String email, required String pwd});
}

final class LoginService implements LoginServiceInterface{

 static const String user_data_key = "userData";
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
    await Future.delayed(Duration(seconds: 2));
    final LocalDB _localDB = await LocalDB.instance();
    final bool _loginCheck = _localDB.getBool(_LOGIN_CHECK_KEY) ?? false;
    // print(_loginCheck);

    if(!_loginCheck) return false;
    final Map<String, dynamic> _userData =  await _localDB.getDatas(user_data_key);

    if(_userData.isEmpty) return false;
    /// Model parser + @ script로 들어오는 경우 대비
    if(_userData[login_key] == null) return false;
    if(_userData[token_key] == null) return false;
    if(_userData[refreshToken_key] == null) return false;
    if(_userData[expiresIn_key] == null) return false;
    if(_userData[email_key] == null) return false;
    if(_userData[displayName_key] == null) return false;
    final _res = await await HttpModule.instance.post(
       uri: "${ServiceEnv.endPoint}/auth/check",
       headers: {"content-type": "application/json"},
       body: json.encode(
           AuthSignInCheckModel(email: _userData[email_key].toString(), idToken: _userData[token_key].toString()).toMap()
     )
   );

   /// {code : 200 ~ 400, body: true / false}
  final Map<String, dynamic> _result = json.decode(_res.body);

  /// code, body: AuthCheckModel as AuthDataModel
  final _resModel = AuthResponseModel.authCheck(_result);
  final _body = _resModel.body as AuthCheckModel;
  return _body.check;
}



  /// Firebase Login함수 구현
  @override
  Future<bool> login({required String email, required String pwd})  async {
          final _body = json.encode(
          AuthSignInModel(email: email, password: base64Encode(pwd.codeUnits)).toMap()
        );

          // throw "stop";

          /// HttpMouldeResponseModel에는 body & statusCode가 들어있다.

          final HttpModuleResponseModelInterface _res = await HttpModule.instance.post(
                uri: "${ServiceEnv.endPoint}/auth",
                headers: {"content-type": "application/json"},
                body: _body
          );

          final Map<String, dynamic> _result = json.decode(_res.body);


          // 오류 확인
          /// code랑 body로 나눠저 가지고 있는다.
          /// body는 AuthResponseModel.json으로 돌려서 FirebaseAuthDataOkModel로 가지고 있게 된다.
          AuthResponseModel model = AuthResponseModel.json(_result);


          /// FirebaseAuthDataModel 현재 여기에 아무것도 없는데?
          final _firebaseModel = model.body as FirebaseAuthDataModel;


          // model.code, model.body
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
              final bool _save_check = await _db.setDatas(user_data_key, {
                  login_key : true,
                  token_key: _okModel.idToken,
                  refreshToken_key : _okModel.refreshToken,
                  expiresIn_key: _okModel.expiresIn,
                  email_key : _okModel.email,
                  displayName_key: _okModel.displayName});

              /// + LOGIN_CHECK_KEY, true
              final bool _saveCheck2 = await _db.setBool(_LOGIN_CHECK_KEY, true);


              if(!_save_check || !_saveCheck2) return false;
              return true;

          } else{
              final _errModel = _firebaseModel as FirebaseAuthDataErrModel;
              return false;
          }
  }
}