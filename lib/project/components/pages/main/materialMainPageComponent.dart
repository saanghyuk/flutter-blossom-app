import 'package:blossom/project/components/widgets/feedInputComponent.dart';
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
      inputWidget: FeedInputComponent(),
      feedCardBuilder: (BuildContext context, int index) => FeedCard(onTap: (FeedCardOnTapType type) { print(type); }),
      feedCardItemCount: 10,
      feedCardListScrollController : this.scrollController,
    );
  }
}