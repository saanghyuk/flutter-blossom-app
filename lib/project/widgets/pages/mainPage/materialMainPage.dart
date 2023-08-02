import 'package:flutter/material.dart';

class MaterialMainPage extends StatelessWidget {
  final Widget inputWidget;
  final List<Widget>? _feedCard;
  final int? _feedCardItemCount;
  final Widget Function(BuildContext, int)? _feedCardBuilder;
  final bool _isBuilder;
  final ScrollController feedCardListScrollController;
  const MaterialMainPage({Key? key, required this.inputWidget, required List<Widget> feedCard, required this.feedCardListScrollController})
      : _feedCardItemCount = null, _isBuilder = false, _feedCard = feedCard, _feedCardBuilder= null, super(key: key);

  const MaterialMainPage.builder({
    super.key,
    required this.inputWidget,
    required Widget Function(BuildContext context, int index) feedCardBuilder,
    required int feedCardItemCount, required this.feedCardListScrollController}):
        _isBuilder = true,
        _feedCardBuilder = feedCardBuilder,
        _feedCardItemCount = feedCardItemCount,
        _feedCard = null;

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
                    if(_isBuilder) Expanded(
                        child: ListView.builder(
                            controller: this.feedCardListScrollController,
                            itemCount: this._feedCardItemCount!,
                            itemBuilder: this._feedCardBuilder!
                        )
                    )
                    else Expanded(
                        child: ListView(
                          controller: this.feedCardListScrollController,
                          physics: BouncingScrollPhysics(),
                          children: this._feedCard!,
                        )
                    )
                  ],
                )
            )
        )
    );
  }
}