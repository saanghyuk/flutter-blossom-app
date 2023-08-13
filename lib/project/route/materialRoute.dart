import 'package:blossom/project/pages/mainpage/mainPage.dart';
import 'package:blossom/project/pages/splashpage/splashPage.dart';
import 'package:blossom/project/widgets/pages/loginPage/loginPage.dart';
import 'package:flutter/material.dart';

class ProjectMaterialRoute extends StatelessWidget {
  const ProjectMaterialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings route){
        if(route.name == LoginPage.path) return MaterialPageRoute(
            builder: LoginPage.builder,
            settings: LoginPage.settings
        );

        if(route.name == MainPage.path){
          return MaterialPageRoute(settings: MainPage.settings, builder: MainPage.builder);
        }
        return MaterialPageRoute(
          settings: SplashPage.settings,
          builder: SplashPage.builder,
        );
      },
    );
  }
}