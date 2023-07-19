import 'dart:io';

import 'package:blossom/project/components/pages/splash/cupertinoSplashPageComponent.dart';
import 'package:blossom/project/components/pages/splash/materialSplashPageComponent.dart';
import 'package:blossom/project/pages/mainpage/mainPage.dart';
import 'package:flutter/widgets.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String path = "/splash";
  static final RouteSettings settings = RouteSettings(
    name : SplashPage.path,
  );
  static final Widget Function(BuildContext) builder = (BuildContext context){
    return SplashPage();
  };

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      Future.delayed(Duration(seconds: 3), () async => await Navigator.of(context).pushReplacementNamed(MainPage.path));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) return CupertinoSplashPageComponent();
    return MaterialSplashPageComponent();
  }
}
