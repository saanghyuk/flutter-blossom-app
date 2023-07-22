import 'package:blossom/project/widgets/feedInput.dart';
import 'package:blossom/project/widgets/pages/mainPage/materialMainPage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MaterialMainPageComponent extends StatelessWidget {
  const MaterialMainPageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialMainPage(inputWidget: FeedInput(
      title: "Hello!",
      inkWellOnTap: (int index) async {
        if(index == 0){
          print("0 clicked");
        }else if(index == 1){
          print("1 clicked");
        }else{
          print("2 clicked");
        }
      },
    )
    );
  }
}