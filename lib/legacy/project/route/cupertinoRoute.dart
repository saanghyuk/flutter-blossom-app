import 'package:blossom/project/pages/mainpage/mainPage.dart';
import 'package:flutter/cupertino.dart';

import '../pages/splashpage/splashPage.dart';

class ProjectCupertinoRoute extends StatelessWidget {
  const ProjectCupertinoRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: (RouteSettings route){

        if(route.name == MainPage.path){
          return CupertinoPageRoute(settings: MainPage.settings, builder: MainPage.builder);
        }

        return CupertinoPageRoute(
          settings: SplashPage.settings,
          builder: SplashPage.builder,
        );
      },
    );
  }
}