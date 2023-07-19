import 'dart:async';

import 'package:flutter/material.dart';


class FeedInput extends StatelessWidget {
  final String title;
  // 넣는거, 받는거 두 가지로 쓸 것.
  final bool _isDefault;


  final int? _buttonCount;
  final Widget Function(BuildContext, int)? _builder;
  const FeedInput({Key? key, required this.title})
      : _isDefault = true, _builder=null, _buttonCount = null, super(key: key);
  const FeedInput.builder({
    required this.title,
    required int buttonCount,
    required Widget Function(BuildContext, int) builder
  }) : _isDefault = false, _buttonCount = buttonCount, _builder = builder;


  final TextStyle _titleTxtStyle = const TextStyle(
    fontSize: 40.0,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    // final Widget _c = Container();
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              this.title,
              style: this._titleTxtStyle,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, //OutlineInputBorder
                contentPadding: EdgeInsets.only(left:10.0),
              ),
            ),
          ),
          Container(
            child: Row(
              children: this._btns(context),
            )
          )
        ],
      )
    );
  }

  List<Widget> _btns(BuildContext context){
    if(!this._isDefault) return List<int>.generate(
          this._buttonCount!,
          (index) => index).map<Widget>((int index) => this._builder!(context, index)).toList();;
    return [
      Expanded(child: FeedButton(title: "image", icon: Icons.camera_alt )),
      Expanded(child: FeedButton(title: "image", icon: Icons.camera_alt )),
      Expanded(child: FeedButton(title: "image", icon: Icons.camera_alt )),
    ];
  }
}


class FeedButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final FutureOr<void> Function()? onTap;
  const FeedButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(this.icon),
              Text(this.title),
            ],
          )
      ),
    );
  }
}
