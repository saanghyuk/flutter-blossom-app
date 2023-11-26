/// with ChangeNotifier
///


import 'dart:async';
import 'package:blossom/project/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../services/loginService.dart';




class LoginPageStateModel{
  final bool loginState;
  final String? errMsg;
  final String? imgSrc;
  LoginPageStateModel({
    this.loginState = false,
    this.errMsg,
    this.imgSrc});
}

final class LoginPageNotifier extends StateNotifier<LoginPageStateModel>{

  LoginPageNotifier(super.state){
    _socketInit();
  }
  // LoginPageNotifier(LoginPageStateModel model): super(model);

  final LoginServiceInterface _loginService = LoginService();

  // bool _loginState = false;
  // bool get loginState => this._loginState;

  // 독립적으로 프로바이더를 바라봤을때 --> 이래서 State를 전역 Provider로 따로 뺄까 라는 고민을 하게 된다.
  Future<bool> loginStateChange() async {
    /// 검증이 필요하다. 검증하는 로직은 또 서비스에 있어야 한다.
    final bool _check = await this._loginService.loginCheck();
    // this._loginState = _check;
    // this.notifyListeners();
    this.state = LoginPageStateModel(
      loginState: _check,
      errMsg: this.state.errMsg,
      imgSrc: this.state.imgSrc
    );
    return _check;
  }


  /// Get / Set
  // String errMsg = "";


  Future login({
    required String email,
    required String pwd,
    required Future<void> Function() onLogin,
    required Future<void> Function() onErr}) async {
    final _loginCheck = await _loginService.login(email: email, pwd: pwd);

    if(_loginCheck){
      this.state = LoginPageStateModel(
        loginState: true,
        errMsg: "...",
        imgSrc: this.state.imgSrc
      );
      await onLogin();
    } else {
      // print("오류입니다.");
      this.state = LoginPageStateModel(
          loginState: false,
          errMsg: "오류 입니다",
          imgSrc: this.state.imgSrc
      );
    }
  }

  IO.Socket? _socket;

  void _socketInit(){
    this._socket = IO.io(
        ServiceEnv.wsEndPoint,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .build()
    )
    // 연결 됬을 때 호출될 이벤트
      ..onConnect((_) {
        print('Login Socket Connect');
      })
      ..on("loginImgSrc", (data){
        this.state = LoginPageStateModel(
            loginState: this.state.loginState,
            errMsg: this.state.errMsg,
            imgSrc: data
        );
      })
    // 연결 할 것
      ..connect();
  }

  void socketClose(){
    this._socket?.close();
  }

}


final loginPageRiverpod = StateNotifierProvider<LoginPageNotifier, LoginPageStateModel>(
        (ref) => LoginPageNotifier(LoginPageStateModel())
);