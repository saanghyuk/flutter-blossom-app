import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/widgets/pages/loginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../pages/mainPage/mainPage.dart';

class LoginPageComponent extends StatelessWidget {
  const LoginPageComponent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    LoginPageProvider _loginProvider = context.read<LoginPageProvider>();


    /// ... 의미 찾아보기 : 숙제 해보기
    // LoginPageWidget.pwd(
    //   email: email.AuthProvider.userName,
    //   onLogin: onLogin(String pwd) async {
    //
    //   }
    // );


    return LoginPageWidget(
        onLogin: (String email, String pwd) {
          _loginProvider.login(
              email: email, pwd: pwd,
              onLogin: () async {
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