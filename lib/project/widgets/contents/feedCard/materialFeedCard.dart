import 'dart:async';
import 'package:blossom/project/widgets/contents/feedCard/feedCard.dart';
import 'package:flutter/material.dart';

enum FeedCardOnTapType{
  User,
  Menu,
  Like1,
  Share1,
  Like2,
  Share2,
  ContentImage,
}

class MaterialFeedCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String circleImage;
  final String image;
  final String des;
  final bool isCheck;
  final int likeCount;
  final int shareCount;
  final FutureOr<void> Function(FeedCardOnTapType) onTap;


  const MaterialFeedCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.circleImage,
    required this.image,
    required this.isCheck,
    required this.likeCount,
    required this.shareCount,
    required this.onTap,
    required this.des
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: Offset(0, 1)
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:() async {
                      await this.onTap(FeedCardOnTapType.User);
                    } ,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(this.circleImage),
                    )
                ),
                SizedBox(width: 6.0),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Blossom - Beauty mobile UI Kit 33+ Screens , Available for Sketch, XD & Figma, #Beauty, #Advertisement, #mobile, #UI, #Advertisement", overflow: TextOverflow.ellipsis,),
                        Text("SubTitle")
                      ],
                    ),
                ),
                SizedBox(width: 4.0),
                IconButton(onPressed: () async => this.onTap(FeedCardOnTapType.Menu), icon: Icon(Icons.more_vert))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(this.des),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(this.image),
                  )
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(child: Row(
                  children: [
                    IconButton(
                      onPressed: () async => await this.onTap(FeedCardOnTapType.Like1),
                      icon: Icon(Icons.book),
                      color: Colors.red,
                    ),
                    Text("100K"),
                    IconButton(
                        onPressed: () async => await this.onTap(FeedCardOnTapType.Share1),
                        icon: Icon(Icons.share)),
                    Text(this.shareCount.toString()),
                  ],
                )),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async => await this.onTap(FeedCardOnTapType.Like2),
                        icon: Icon(Icons.book)),
                    IconButton(
                        onPressed: () async => await this.onTap(FeedCardOnTapType.Share2),
                        icon: Icon(Icons.share))
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
