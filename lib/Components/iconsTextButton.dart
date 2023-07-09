import 'dart:async';

import 'package:flutter/material.dart';


class IconTextButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool isActive;
  const IconTextButton({Key? key, required this.text, required this.iconData, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(
              iconData,
              color: this.isActive ? null : Colors.grey
          ),
          Text(this.text, style: TextStyle(
              color: this.isActive ? null : Colors.grey
          ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      );
  }
}
