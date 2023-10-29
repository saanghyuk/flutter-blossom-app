
import 'package:blossom/project/components/widgets/feedInputComponent.dart';
import 'package:blossom/project/models/mainDataObject/mainDataModel.dart';
import 'package:blossom/project/providers/mainPageDataProvider.dart';
// import 'package:blossom/project/widgets/content/feedCard/feedCard.dart';
// import 'package:blossom/project/widgets/content/feedCard/materialFeedCard.dart';
import 'package:blossom/project/widgets/content/feedInput/materialFeedInput.dart';


/// 2로 교체
// import 'package:blossom/project/widgets/pages/mainPage/materialMainPage.dart';
import 'package:blossom/project/widgets/pages/mainPage/materialMainPage2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/content/feedCard/feedCard_exports.dart';
// import 'package:flutter/widgets.dart';

class MaterialMainPageComponent extends StatelessWidget {
  final ScrollController scrollController;
  const MaterialMainPageComponent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<MainPageDataProvider>();
    if(_provider.data == null) return Container(); /// 로딩 페이지 같은 것을 만들어 줘야 한다.
    return MaterialMainPage2.builder(
      inputWidget: FeedInputComponent(),
      feedCardBuilder: (BuildContext context, int index) {
        List<MainDataModel> mainData = _provider.data!.data;
        final MainDataModel data = mainData[index];
        return FeedCard(
        onTap: (FeedCardOnTapType type) {
            print(type);
          },
        title: data.title.txt,
        subTitle: data.title.subTitle,
        circleImage: data.title.image,
        des: data.des.des,
        image: data.des.images[0],
        isCheck: data.active,
        likeCount: data.f_count,
        shareCount: data.s_count,);
      },
      feedCardItemCount: _provider.data!.data.length,
      feedCardListScrollController : this.scrollController,
    );
  }
}