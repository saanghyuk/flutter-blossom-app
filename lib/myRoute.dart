import 'package:blossom/pages/home.dart';
import 'package:blossom/pages/splash.dart';
import 'package:flutter/material.dart';


class MyRoute extends StatelessWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings route){
        if(route.name == Home.path) return MaterialPageRoute(
            builder: (_) => Home()
        );
        return MaterialPageRoute(
            settings: RouteSettings(name: Splash.path),
            builder: (_) => Splash(),
        );
      },
    );
  }
}
