import 'dart:convert';

import 'package:blossom/project/modules/httpModule.dart';
import 'package:blossom/project/modules/localDB.dart';

import '../models/authDataObject/authModel.dart';

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
  Future<bool> login({required String email, required String pwd})  async {
          final HttpModuleResponseModel _res = await HttpModule.post(
                uri: "http://192.168.45.171:3000/auth",
                headers: {"content-type": "application/json"},
                body: json.encode(AuthSignInModel(
                email: email,
                password: pwd).toMap()
          ));

          Map<String, dynamic> _result = json.decode(_res.body);
          print(_result);
          final AuthSignInResponseModel _userData = AuthSignInResponseModel.json(json:_result);
          return true;
}
}