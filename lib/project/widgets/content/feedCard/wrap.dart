
import 'dart:async';
import 'package:flutter/widgets.dart';

import 'feedCardOnTapTypeEnum.dart';


// 파일 분리

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

    throw "feedCard";
  }
}
