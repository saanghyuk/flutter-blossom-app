import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/widgets/pages/loginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../pages/mainPage/mainPage_exports.dart';

// import '../../../pages/mainPage/mainPage.dart';


class LoginPageComponent extends StatelessWidget {
  const LoginPageComponent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    LoginPageProvider _loginProvider = context.watch<LoginPageProvider>();


    /// ... 의미 찾아보기 : 숙제 해보기
    // LoginPageWidget.pwd(
    //   email: email.AuthProvider.userName,
    //   onLogin: onLogin(String pwd) async {
    //
    //   }
    // );


    return LoginPageWidget(
        imgSrc: _loginProvider.imgSrc,
        onLogin: (String email, String pwd) {
          _loginProvider.login(
              email: email, pwd: pwd,
              onLogin: () async {
                  /// @TODO 다시 로그인 페이지 접근시 연결 해야함. 그래서 라이프사이클로 쓰는게 낫다
                  _loginProvider.socketClose();
                  await Navigator.of(context).pushReplacementNamed(MainPage.path);
              },
              onErr: () async {
                  await showDialog(
                      context: context,
                      builder:(c) => AlertDialog(
                          title: Text(_loginProvider.errMsg)
                      )
                  );
                }
              );
        },
        /// 팝업 말고인 경우 대비해 넣어놓음
        errMsg: _loginProvider.errMsg
    );
  }
}