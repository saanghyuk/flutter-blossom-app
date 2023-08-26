import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/widgets/pages/loginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageComponent extends StatelessWidget {
  const LoginPageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginPageProvider _loginProvider = context.read<LoginPageProvider>();
    return LoginPageWidget(

    );
  }
}