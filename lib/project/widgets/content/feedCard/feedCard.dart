import 'dart:io';
import 'package:blossom/project/widgets/content/feedCard/cupertinoFeedCard.dart';
import 'package:blossom/project/widgets/content/feedCard/materialFeedCard.dart';
import 'package:flutter/widgets.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 언제나 모바일만 가능하다.
    if(Platform.isAndroid) return MaterialFeedCard();
    return CupertinoFeedCard();
  }
}

