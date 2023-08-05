import 'dart:async';

import 'package:flutter/material.dart';

class FeedInput extends StatefulWidget {
  final bool? _ignore;
  final double? _opacity;
  final double? _height;
  final String title;
  final void Function(Size)? _renderDone;
  final bool _isDefault;
  final int? _buttonCount;
  final FutureOr<void> Function(int)? _inkWellOnTap;
  final Widget Function(BuildContext, int)? _builder;
  const FeedInput({Key? key, required this.title, Future<void> Function(int)? inkWellOnTap})
      :_renderDone = null, _ignore = null, _opacity = null, _height= null, _inkWellOnTap = inkWellOnTap, _isDefault= true, _builder = null, _buttonCount = null, super(key: key);
  const FeedInput.builder({
    required this.title,
    required void Function(Size)? renderDone,
    required int buttonCount,
    required Widget Function(BuildContext, int) builder, required double? height, required double opacity, required bool ignore,
  }) : _renderDone = renderDone, _ignore = ignore, _height = height, _opacity = opacity, _isDefault = false, _builder = builder, _buttonCount = buttonCount, _inkWellOnTap = null;



  @override
  State<FeedInput> createState() => _FeedInputState();
}

class _FeedInputState extends State<FeedInput> {

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        final RenderBox? _box = this.context.findRenderObject() as RenderBox;
        if(_box == null) throw "_BOX ERR"; // TODO: 개발단계에서만 사용하고 변경
        if(this.widget._renderDone == null) return;
        this.widget._renderDone!(_box.size);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Widget _c = Container();
    const TextStyle _textTxtStyle = const TextStyle(
      fontSize: 20.0,
      color: Colors.red,
    );

    return IgnorePointer(
      ignoring: this.widget._ignore ?? false,
      child: Opacity(
        opacity: this.widget._opacity ?? 1.0,
        child: Container(
            height: this.widget._height,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      child: Text(
                        // this.title,
                          this.widget.title,
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
    if(!this.widget._isDefault) return List<int>.generate(
        this.widget._buttonCount!, (int index) => index).map<Widget>(
            (int index) => this.widget._builder!(context, index)).toList();
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
              onTap: this.widget._inkWellOnTap == null ? null : () async {
                await this.widget._inkWellOnTap!(index);
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
  final FutureOr<void> Function()? onTap;

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