import 'dart:async';
import 'dart:io';
import 'package:blossom/project/widgets/contents/feedCard/cupertinoFeedCard.dart';
import 'package:blossom/project/widgets/contents/feedCard/materialFeedCard.dart';
import 'package:flutter/widgets.dart';

class FeedCard extends StatelessWidget {
  final FutureOr<void> Function(FeedCardOnTapType) onTap;
  const FeedCard({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) return MaterialFeedCard(
        title: "title",
        subTitle: "subTitle",
        circleImage: "https://cdn.pixabay.com/photo/2023/06/04/11/42/river-8039447_1280.jpg",
        des: "위키는 간단한 마크업 언어와 웹 브라우저를 이용, 함께 문서를 작성하는 공동체를 가능케 한다. 위키 웹사이트의 한 문서는 위키 문서라 부르며, 하이퍼링크로 서로 연결된 전체 문서를 위키라 한다. 위키는 본질적으로 정보를 만들고, 찾아보고, 검색하기 위한 데이터베이스다.",
        image: "https://cdn.pixabay.com/photo/2023/06/04/11/42/river-8039447_1280.jpg",
        isCheck: true,
        likeCount: 10,
        shareCount: 1,
        onTap: this.onTap,
          // switch
        );
    return CupertinoFeedCard();
  }
}
