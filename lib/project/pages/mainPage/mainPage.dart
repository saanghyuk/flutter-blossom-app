import 'dart:io';

import 'package:blossom/project/components/pages/main/cupertinoMainPageComponent.dart';
import 'package:blossom/project/components/pages/main/materialMainPageComponent.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String path = "/main";
  static const RouteSettings settings = RouteSettings(
    name: MainPage.path
  );
  static final Widget Function(BuildContext context) builder = (BuildContext context) => MainPage();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    this._scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) return CupertinoMainPageComponent(
        // scrollController: this._scrollController
    );
    return MaterialMainPageComponent(
      scrollController: this._scrollController
    );
  }
}
