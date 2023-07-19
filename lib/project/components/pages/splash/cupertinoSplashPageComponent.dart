import 'package:blossom/project/widgets/pages/splashPage/cupertinoSplashPage.dart';
import 'package:flutter/widgets.dart'; 

class CupertinoSplashPageComponent extends StatelessWidget {
  const CupertinoSplashPageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSplashPage(txt: "Hello");
  }
}
