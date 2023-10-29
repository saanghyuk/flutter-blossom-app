

// _app.dart
// android/ios 분기 -> dart.io

// 일단 splashPage에서 mainPage를 실행할때 여기 있는 값을 쓰는 것처럼 착각하는데,
// 실제로는 app.dart, web.dart에 써있는 것을 쓴다.
// app 이나 web에 있는 것들 싹다 선언이 되어 있어야 한다.

import 'package:flutter/widgets.dart';



// 여기서는 아무 값이 없어도 된다.
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String path = "";
  static const RouteSettings settings = RouteSettings();
  static final Widget Function(BuildContext context) builder = (BuildContext context) => throw "Builder";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    throw "Wrap";
  }
}