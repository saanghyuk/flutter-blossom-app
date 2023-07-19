import 'dart:io';

import 'package:blossom/project/components/pages/main/cupertinoMainPageComponent.dart';
import 'package:blossom/project/components/pages/main/materialMainPageComponent.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String path = "/main";
  static const RouteSettings settings = RouteSettings(
    name: MainPage.path
  );
  static final Widget Function(BuildContext context) builder = (BuildContext context) => MainPage();

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) return CupertinoMainPageComponent();
    return MaterialMainPageComponent();
  }
}
