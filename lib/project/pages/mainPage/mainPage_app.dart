// _app.dart
// android/ios 분기 -> dart.io

import 'dart:io';

import 'package:blossom/project/components/pages/main/cupertinoMainPageComponent.dart';
import 'package:blossom/project/components/pages/main/materialMainPageComponent.dart';
import 'package:blossom/project/providers/mainPageDataProvider.dart';
import 'package:blos'
    'som/project/providers/mainPageProvider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final _dataProvider = this.context.watch<MainPageDataProvider>();
    final _provider = this.context.read<MainPageProvider>();
    this._scrollController.addListener(() {
      // 값을 사용할게 아니라서 notifylistner에서 업데이트 할 필요가 없다.
      // 단순히 그 함수를 호출만 할꺼니깐 괜찮다.
      if(!this._scrollController.hasClients) return;
      _provider.event(
          this._scrollController.position.pixels,
          this._scrollController.position.userScrollDirection == ScrollDirection.reverse
      );
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this._scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) return CupertinoMainPageComponent();
    return MaterialMainPageComponent(
        scrollController : this._scrollController
    );
  }
}