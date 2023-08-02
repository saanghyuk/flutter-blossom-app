import 'dart:async';

import 'package:flutter/material.dart';

class FeedInput extends StatelessWidget {
  final String title;
  final bool _isDefault;
  final int? _buttonCount;
  final FutureOr<void> Function(int)? _inkWellOnTap;
  final Widget Function(BuildContext, int)? _builder;
  const FeedInput({Key? key, required this.title, Future<void> Function(int)? inkWellOnTap})
      : _inkWellOnTap = inkWellOnTap, _isDefault= true, _builder = null, _buttonCount = null, super(key: key);
  const FeedInput.builder({
    required this.title,
    required int buttonCount,
    required Widget Function(BuildContext, int) builder
  }) : _isDefault = false, _builder = builder, _buttonCount = buttonCount, _inkWellOnTap = null;



  @override
  Widget build(BuildContext context) {
    final Widget _c = Container();
    const TextStyle _textTxtStyle = const TextStyle(
      fontSize: 20.0,
      color: Colors.red,
    );

    return IgnorePointer(
      ignoring: false,
      child: Opacity(
        opacity: 1.0,
        child: Container(
            height: null,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      child: Text(
                        // this.title,
                          this.title,
                          overflow: TextOverflow.ellipsis,
                          style: _textTxtStyle
                      )
                  ),
                  Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                        ),
                      )
                  ),
                  Container(
                      child: Row(
                        children: this._btns(context),
                      )
                  )
                ],
              ),
            )

        ),
      ),
    );

  }

  List<Widget> _btns(BuildContext context){
    if(!this._isDefault) return List<int>.generate(
        this._buttonCount!, (int index) => index).map<Widget>(
            (int index) => this._builder!(context, index)).toList();
    List<Map<String, dynamic>> buttonList = [
      {"title": "askldfjal;ksdjf;lkasjdf;lkajsd;lkfjas;lkdfjas;lkdfj;alk", "icon": Icons.camera_alt},
      {"title": "Image", "icon": Icons.camera_alt},
      {"title": "Image", "icon": Icons.camera_alt}
    ];
    return buttonList.map((Map<String, dynamic> e) {
      final int index = buttonList.indexOf(e);
      return Expanded(
          child: FeedButton(
              title: e["title"],
              icon: e["icon"],
              onTap: this._inkWellOnTap == null ? null : () async {
                await this._inkWellOnTap!(index);
              }
          )
      );
    }
    ).toList();
  }
}



class FeedButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Future<void> Function()? onTap;

  const FeedButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(this.icon),
              // Expanded 안 썼을때 overflow 나는 것은 icon이랑 겹쳐지는 것.
              Expanded(
                  child: Text(this.title, overflow: TextOverflow.ellipsis)
              )
              // Text(this.title)
            ],
          )
      ),
    );
  }
}