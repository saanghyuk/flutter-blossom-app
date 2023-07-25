import 'package:flutter/material.dart';

class MaterialMainPage extends StatelessWidget {
  final Widget inputWidget;
  final List<Widget> feedCard;
  const MaterialMainPage({Key? key, required this.inputWidget, required this.feedCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              this.inputWidget,
              SizedBox(height: 20.0),
              ...this.feedCard
            ],
          )
        )
      )
    );
  }
}