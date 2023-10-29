import 'dart:async';
import 'package:flutter/widgets.dart';

import 'feedCardOnTapTypeEnum.dart';
import 'materialFeedCard.dart';



class FeedCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String circleImage;
  final String des;
  final String image;
  final bool isCheck;
  final int likeCount;
  final int shareCount;
  final FutureOr<void> Function(FeedCardOnTapType) onTap;
  const FeedCard({Key? key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.circleImage,
    required this.des,
    required this.image,
    required this.isCheck,
    required this.likeCount,
    required this.shareCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 언제나 모바일만 가능하다.
    return MaterialFeedCard(
      title: this.title,
      subTitle: this.subTitle,
      circleImage: this.circleImage,
      des: this.des,
      image: this.image,
      isCheck: this.isCheck,
      likeCount: this.likeCount,
      shareCount: this.shareCount,
      onTap: this.onTap,
      // switch
    );
  }
}
