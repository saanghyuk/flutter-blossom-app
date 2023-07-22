import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedInput extends StatelessWidget {
  final String title;
  final bool _isDefault;
  final int? _buttonCount;
  final Widget Function(BuildContext, int)? _builder;
  const FeedInput({Key? key, required this.title})
      : _isDefault= true, _builder = null, _buttonCount = null, super(key: key);
  const FeedInput.builder({
    required this.title,
    required int buttonCount,
    required Widget Function(BuildContext, int) builder})
      : _isDefault = false, _builder = builder, _buttonCount = buttonCount;



  @override
  Widget build(BuildContext context) {
    final Widget _c = Container();
    const TextStyle _textTxtStyle = const TextStyle(
      fontSize: 20.0,
      color: Colors.red,
    );

    return Container(
        child: Column(
          children: [
            Container(
                child: Text(
                  // this.title,
                  this.title,
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
        )

    );

  }

  List<Widget> _btns(BuildContext context){
    if(!this._isDefault) return List<int>.generate(
        this._buttonCount!, (int index) => index).map<Widget>(
            (int index) => this._builder!(context, index)).toList();
    return [
      Expanded(child: FeedButton(title: "Image", icon: Icons.camera_alt)),
      Expanded(child: FeedButton(title: "Image", icon: Icons.camera_alt)),
      Expanded(child: FeedButton(title: "Image", icon: Icons.camera_alt)),
    ];

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
            Text(this.title)
          ],
        )
      ),
    );
  }
}