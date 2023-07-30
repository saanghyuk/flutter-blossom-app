import 'package:blossom/project/widgets/contents/feedCard/feedCard.dart';
import 'package:blossom/project/widgets/contents/feedCard/materialFeedCard.dart';
import 'package:blossom/project/widgets/contents/feedInput/feedInput.dart';
import 'package:blossom/project/widgets/pages/mainPage/materialMainPage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MaterialMainPageComponent extends StatelessWidget {
  final ScrollController scrollController;
  const MaterialMainPageComponent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialMainPage.builder(inputWidget: FeedInput.builder(
        title: "title",
        buttonCount: 3,
        builder: (BuildContext context, int index){
          if(index == 0) return Expanded(
              child: FeedButton(
                title: "Image",
                icon: Icons.photo_album,
                onTap: () async {
                  print("0 clicked");
                },
              ));
          else if(index == 1) return Expanded(
              child: FeedButton(
                  title: "Video",
                  icon: Icons.video_call_rounded,
                  onTap: () async {
                    print("1 clicked");
                  }
              ));
          return Expanded(
              child: FeedButton(
                  title: "Camera",
                  icon: Icons.camera_alt,
                  onTap: () async {
                    print("2 clicked");
                  }
              ));
        }),
      // feedCard: [
      //   FeedCard(
      //     /// 중요: 개별적인 상태가 존재하는지 확인
      //     onTap: (FeedCardOnTapType type) {
      //
      //     },
      //   ),
      // ]
      feedCardListScrollController : this.scrollController,
      feedCardItemCount: 10,
      feedCardBuilder: (BuildContext context, int index) => FeedCard(
        onTap: (FeedCardOnTapType type) {},
      ),

    );
  }
}