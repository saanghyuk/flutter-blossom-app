import 'package:flutter/material.dart'; 

class MainView extends StatefulWidget {
  final Widget inputWidget;
  final bool _isBuilder;
  final ScrollController feedCardListScrollController;
  final int? _feedCardItemCount;
  final Widget Function(BuildContext, int)? _feedCardBuilder;
  final List<Widget>? _feedCard;

  const MainView({
    Key? key,
    required this.inputWidget,
    required this.feedCardListScrollController,
    required List<Widget> feedCard}) :
        _isBuilder = false,
        _feedCardItemCount = null,
        _feedCardBuilder = null,
        _feedCard = feedCard,
        super(key: key);
  const MainView.builder({
    Key? key,
    required this.inputWidget,
    required this.feedCardListScrollController,
    required int feedCardItemCount,
    required Widget Function(BuildContext, int) feedCardBuilder,
  }) : _isBuilder = true,
        _feedCardItemCount = feedCardItemCount,
        _feedCard = null,
        _feedCardBuilder = feedCardBuilder, super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(
              children: [
                this.widget.inputWidget,
                SizedBox(height: 20.0),
                if(this.widget._isBuilder) Expanded(
                    child: ListView.builder(
                        controller: this.widget.feedCardListScrollController,
                        itemCount: this.widget._feedCardItemCount!,
                        itemBuilder: this.widget._feedCardBuilder!
                    )
                )
                else Expanded(
                    child: ListView(
                      controller: this.widget.feedCardListScrollController,
                      physics: BouncingScrollPhysics(),
                      children: this.widget._feedCard!,
                    )
                )
              ],
            )
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
