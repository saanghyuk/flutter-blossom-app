import 'package:blossom/project/providers/mainPageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/content/feedInput/materialFeedInput.dart';

class FeedInputComponent extends StatelessWidget {
  const FeedInputComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<MainPageProvider>();
    return FeedInput.builder(
      title: "Hello!",
      buttonCount: 3,
      builder: (BuildContext context, int index){
        return Expanded(child: FeedButton(
          icon: Icons.camera,
          title: "IMAGEIMAGEIMAGE",
          onTap: () async {
            if(index == 0){
              print("0");
            }
          },
        ));
      },
      height: _provider.height,
      opacity: _provider.opacity,
      ignore: _provider.ignore,
      renderDone: (Size size) {
        _provider.setBaseHeight(size.height);
      },
    );
  }
}
