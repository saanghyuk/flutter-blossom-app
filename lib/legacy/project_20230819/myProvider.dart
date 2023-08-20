
import 'package:blossom/project/myRoute.dart';
import 'package:blossom/project/providers/mainPageProvider.dart';
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
      )
    ];
    List<ChangeNotifierProvider> _splashProviders = [
      ChangeNotifierProvider<SplashPageProvider>(create: (_) => SplashPageProvider())
    ];
    return MultiProvider(
        providers: [
          ..._mainProviders,
          ..._splashProviders,
        ], child: ProjectRoute());
  }
}