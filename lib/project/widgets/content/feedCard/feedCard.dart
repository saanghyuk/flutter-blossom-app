import 'dart:io';
import 'package:blossom/project/widgets/content/feedCard/cupertinoFeedCard.dart';
import 'package:blossom/project/widgets/content/feedCard/materialFeedCard.dart';
import 'package:flutter/widgets.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 언제나 모바일만 가능하다.
    if(Platform.isAndroid) return MaterialFeedCard(
        title: "title",
        subTitle: "subTitle",
        circleImage: "https://cdn.pixabay.com/photo/2023/06/04/11/42/river-8039447_1280.jpg",
        des: "des",
        image: "https://cdn.pixabay.com/photo/2023/06/04/11/42/river-8039447_1280.jpg",
        isCheck: true,
        likeCount: 10,
        shareCount: 1,
        onTap: (FeedCardOnTapType type) async {
          // 분기 친다.
          print(type);
          // switch
        });
    return CupertinoFeedCard();
  }
}
