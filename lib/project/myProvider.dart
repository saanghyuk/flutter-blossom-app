
import 'package:blossom/legacy/20230906_project/project/pages/mainPage/mainPage.dart';
import 'package:blossom/project/projectRoute/route_export.dart';

import 'package:blossom/project/providers/loginPageProvider.dart';
import 'package:blossom/project/providers/mainPageDataProvider.dart';
import 'package:blossom/project/providers/mainPageProvider.dart';
import 'package:blossom/project/providers/searchProvider.dart';
import 'package:blossom/project/providers/socketioProvider.dart';
import 'package:blossom/project/providers/splashPageProvider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatelessWidget {
  const MyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List _mainProviders = [
      ChangeNotifierProvider<MainPageProvider>(
          create: (_) => MainPageProvider()
      ),
      ChangeNotifierProxyProvider<LoginPageProvider, MainPageDataProvider>(
          create: (BuildContext context) => MainPageDataProvider(loginPageProvider: context.read<LoginPageProvider>()),
          update: (BuildContext context, LoginPageProvider loginProvider, _) => MainPageDataProvider(loginPageProvider: loginProvider)
      )

    ];

    List<ChangeNotifierProvider> _splashProviders = [
      ChangeNotifierProvider<SplashPageProvider>(create: (_) => SplashPageProvider())
    ];

    List<ChangeNotifierProvider> _loginProviders = [
      ChangeNotifierProvider<LoginPageProvider>(create: (_) => LoginPageProvider()),
    ];

    List<ChangeNotifierProvider> _searchProviders = [
      ChangeNotifierProvider<SearchProvider_G>(create: (_) => SearchProvider_G())
    ];

    List _socketProviders = [
      ChangeNotifierProvider<SocketIoProvider>(create: (_) => SocketIoProvider())
    ];

    return MultiProvider(
        providers: [
          ..._loginProviders,
          ..._mainProviders,
          ..._splashProviders,
          ..._searchProviders,
          ..._socketProviders
        ], child: ProjectRoute());
  }
}