import 'package:blossom/project/pages/mainPage.dart';
import 'package:flutter/material.dart';

import '../pages/splashPage/splashPage.dart';


class ProjectMaterialRoute extends StatelessWidget {
  const ProjectMaterialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings route){

        if(route.name == MainPage.path){
          return MaterialPageRoute(settings: MainPage.settings, builder: MainPage.builder);
        }

        return MaterialPageRoute(
            settings: SplashPage.settings,
            builder:  SplashPage.builder,
        );
      },
    );
  }
}
