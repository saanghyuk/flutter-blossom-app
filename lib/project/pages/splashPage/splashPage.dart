import 'dart:io';

import 'package:blossom/project/components/pages/splash/cupertinoSplashPageComponent.dart';
import 'package:blossom/project/components/pages/splash/materialSplashPageComponent.dart';
import 'package:blossom/project/pages/loginPage/loginPage.dart';
import 'package:blossom/project/pages/mainPage/mainPage.dart';
import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/providers/splashPageProvider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String path = "/splash";
  static final RouteSettings settings = RouteSettings(
    name: SplashPage.path
  );
  static final Widget Function(BuildContext) builder = (BuildContext context) {
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
      /// 어차피 build가 다 된 상태라 전역 context를 불러도 된다.
      Future(() async {
        /// TODO:
        /// 미리 테스트하는 용도
        await Future.delayed(Duration(seconds: 2));
        final _provider = context.read<SplashPageProvider>();
        final _loginProvider = context.read<LoginPageProvider>();

        await _provider.loginCheck(
            onDone: () async {
              /// 서버로 두번 간다.
              /// 여기서 첫번째 loginCheck
              final bool _changeResult = await _loginProvider.loginStateChange();
              if(!_changeResult){
                /// 서버는 정상인데 로컬이 문제
                await Navigator.of(context).pushNamed(LoginPage.path);
              }
              /// @TODO : Changeresult에 따라서
              await Navigator.of(context).pushNamed(MainPage.path);
            },
            onErr: () async {
              await Navigator.of(context).pushNamed(LoginPage.path);
            }
        );
      });
      /// 확인 로직 이후에 결과에 따라 화면을 보낼 거야. 그럼 Navigator을 쓴다는 뜻이고, context를 써야 한다.
      /// provider에서 넘겨서 provider안에서 화면 이동을 처리하는게 좋은 것인가?
      // Future.delayed(Duration(seconds: 3), () async => await Navigator.of(context).pushReplacementNamed(MainPage.path)
      // );
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) return CupertinoSplashPageComponent();
    return MaterialSplashPageComponent();
  }
}
