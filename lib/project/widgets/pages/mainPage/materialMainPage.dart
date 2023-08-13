import 'package:blossom/project/anim/projectPageRoute.dart';
import 'package:flutter/material.dart';

class MaterialMainPage extends StatefulWidget {
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
  State<MaterialMainPage> createState() => _MaterialMainPageState();
}

class _MaterialMainPageState extends State<MaterialMainPage> with SingleTickerProviderStateMixin{

  AnimationController? animationController;
  Animation<Offset>? animation;
  Animation<double>? animation2;


  @override
  void initState() {
    // TODO: implement initState
    this.animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    this.animation = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(-1, 0)).animate(this.animationController!);

    this.animation2 = Tween<double>(
        begin: 0,
        end: 200.0
    ).animate(this.animationController!);

    this.animationController!.addListener(() {
      // 값이 지정된 시간만큼 편하는 동안 무엇인가를 해야 한다.
      if(!this.mounted) return;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.animationController!.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey.shade300,
      body: SlideTransition(
        position: animation!,
        child: SafeArea(
            child: Container(
              // 테스트 해보기
              // height: this.animation2!.value,
                child: Column(
                  children: [
                    this.widget.inputWidget,
                    SizedBox(height: 20.0),
                    if(widget._isBuilder) Expanded(
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) async {
          // 실행 해줘야 시간이 흐른다.
          // 그냥 Future로 인식하면 된다.
          this.animationController!.forward();
          await Navigator.of(context).push(
            MaterialProjectPageRoute(
                builder: (_) => Scaffold(
                  appBar: AppBar(),
                ),
                settings: RouteSettings(name : "/test")
            )
          );
          this.animationController!.reverse();
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label:""),
        ],
      ),
    );
  }
}