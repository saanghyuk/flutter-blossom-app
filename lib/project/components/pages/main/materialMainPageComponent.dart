import 'package:blossom/project/widgets/content/feedCard/feedCard.dart';
import 'package:blossom/project/widgets/content/feedCard/materialFeedCard.dart';
import 'package:blossom/project/widgets/content/feedInput/materialFeedInput.dart';
import 'package:blossom/project/widgets/pages/mainPage/materialMainPage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MaterialMainPageComponent extends StatelessWidget {
  final ScrollController scrollController;
  const MaterialMainPageComponent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialMainPage.builder(
      inputWidget: FeedInput(
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
      ),
      feedCardBuilder: (BuildContext context, int index) => FeedCard(onTap: (FeedCardOnTapType type) { print(type); }),
      feedCardItemCount: 3,
      feedCardListScrollController : this.scrollController,
    );
  }
}