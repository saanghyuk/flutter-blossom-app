import 'package:blossom/pages/home.dart';
import 'package:flutter/material.dart';



class Splash extends StatefulWidget {
  static const String path = "splash";
  const Splash ({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(Duration(seconds: 3), (){
          Navigator.of(context).pushReplacementNamed(Home.path);
        });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOGO", style: TextStyle(fontSize: 50.0),),
      ));
  }
}
