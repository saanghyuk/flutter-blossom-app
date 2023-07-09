import 'dart:async';

import 'package:blossom/Components/iconsTextButton.dart';
import 'package:flutter/material.dart';

class UploadBar extends StatelessWidget {
  final String name;
  final FutureOr<void> Function(int) iconsTextButtonCb;
  final FutureOr<void> Function(String)? onSubmittedCb;
  final List<IconTextButton> items;
  const UploadBar({Key? key, required this.items, required this.name, required this.iconsTextButtonCb, this.onSubmittedCb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0, left:10.0),
          child: Row(
            children: [Text("Hi, ${this.name}", style: TextStyle(fontSize: 20.0),)],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10.0, left:10.0),
            child:
            TextField(
              onSubmitted: this.onSubmittedCb,
              decoration: InputDecoration(
                hintText: "Placeholder Placeholder",
                border: InputBorder.none,
              ),
            )
        ),
        Container(
          // color: Colors.blue,
          height: 40,
          child: Row(
            children: [
              ...items.map<Expanded>((IconTextButton e) {
                final _eIndex = this.items.indexOf(e);
                return Expanded(
                  child: GestureDetector(
                      onTap: () => iconsTextButtonCb(_eIndex),
                      child: e
                  ),
                );
              }
              )
            ],
          ),
        ),
      ],
    );
  }
}
