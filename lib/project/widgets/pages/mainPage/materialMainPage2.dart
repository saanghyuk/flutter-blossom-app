import 'package:blossom/project/anim/projectPageRoute.dart';
import 'package:blossom/project/widgets/views/mainView/mainView.dart';
import 'package:blossom/project/widgets/views/searchView/searchView.dart';
import 'package:flutter/material.dart';

class MaterialMainPage2 extends StatefulWidget {
  final Widget inputWidget;
  final List<Widget>? _feedCard;
  final int? _feedCardItemCount;
  final Widget Function(BuildContext, int)? _feedCardBuilder;
  final bool _isBuilder;
  final ScrollController feedCardListScrollController;
  const MaterialMainPage2({Key? key, required this.inputWidget, required List<Widget> feedCard, required this.feedCardListScrollController})
      : _feedCardItemCount = null, _isBuilder = false, _feedCard = feedCard, _feedCardBuilder= null, super(key: key);

  const MaterialMainPage2.builder({
    super.key,
    required this.inputWidget,
    required Widget Function(BuildContext context, int index) feedCardBuilder,
    required int feedCardItemCount,
    required this.feedCardListScrollController}):
        _isBuilder = true,
        _feedCardBuilder = feedCardBuilder,
        _feedCardItemCount = feedCardItemCount,
        _feedCard = null;

  @override
  State<MaterialMainPage2> createState() => _MaterialMainPage2State();
}

class _MaterialMainPage2State extends State<MaterialMainPage2>{

  final PageController _pageController = PageController(initialPage: 1);
  int _pageIndex = 1;

  @override
  void dispose() {
    // TODO: implement dispose
    this._pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: this._pageController,
        children: [
          if(this.widget._isBuilder) MainView.builder(
                  inputWidget: this.widget.inputWidget,
                  feedCardItemCount: this.widget._feedCardItemCount!,
                  feedCardBuilder: this.widget._feedCardBuilder!,
                  feedCardListScrollController: this.widget.feedCardListScrollController
          )
          else MainView(
                inputWidget: this.widget.inputWidget,
                feedCardListScrollController: this.widget.feedCardListScrollController,
                feedCard: this.widget._feedCard!,),

          SearchView(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: this._pageIndex,
        // selectedItemColor: ,
        onTap: (int index){
          if(this._pageIndex == index) return;
          setState(() {
            this._pageIndex = index;
          });
          this._pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
        ],
      ),
    );
  }
}