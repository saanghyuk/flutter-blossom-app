import 'package:blossom/project/widgets/pages/splashPage/materialSplashPage.dart';
import 'package:flutter/widgets.dart'; 

class MaterialSplashPageComponent extends StatelessWidget {
  const MaterialSplashPageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialSplashPage(txt: "Hello");
  }
}
