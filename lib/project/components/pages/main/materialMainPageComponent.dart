import 'package:blossom/project/widgets/inputWidget.dart';
import 'package:blossom/project/widgets/pages/mainPage/materialMainPage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MaterialMainPageComponent extends StatelessWidget {
  const MaterialMainPageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialMainPage(
      // inputWidget: const FeedInput(
      //   title: 'Hello'
      // ),

      // BottomNavigation
      // FeedInput(
      //   onTap: (int index){
      //    onTap달아주는 부분 꼭 찾아보기
      //   }
      //   children: [
      //    FeedButton.item(title : "", icon: "Icons.person"),
      //    FeedButton(),
      //    FeedButton()
      //   ]
      // )
      // ListView, GridView 따라하기
      inputWidget: FeedInput.builder(
        title: "TITLE_BUILDER",
        buttonCount: 3,
        builder: (BuildContext context, int index){
          // if(index == 0) return FeedButton(title: );
          // if(index == 1) return FeedButton(title: );
          // if(index == 2) return FeedButton(title: );
          return Expanded(
            child: FeedButton(
                title: "Image",
                icon: Icons.camera_alt,
                onTap: (){
                  if(index == 0){
                    print("a");
                  }
                }
            ),
          );
        }
      ),
    );
  }
}
