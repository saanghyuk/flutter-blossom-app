import 'package:blossom/project/components/pages/login/loginPageComponent.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String path = "/login";
  static const RouteSettings settings = RouteSettings(
      name : LoginPage.path
  );
  static final Widget Function(BuildContext) builder = (BuildContext context) => LoginPage();


  @override
  Widget build(BuildContext context) {
    return LoginPageComponent();
  }
}