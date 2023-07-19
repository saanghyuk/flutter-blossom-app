import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedInput extends StatelessWidget {
  final String title;
  const FeedInput({Key? key, required this.title}) : super(key: key);

  final TextStyle _textTxtStyle = const TextStyle(
    fontSize: 10.0,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    final Widget _c = Container();
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
                this.title,
            )
          ),
          Container(),
          Container(
            child: Row()
          )
        ],
      )

    );
  }
}

