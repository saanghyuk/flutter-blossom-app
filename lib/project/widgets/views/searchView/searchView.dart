import 'package:blossom/project/widgets/pages/searchPage/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: TextField(
              readOnly: true,
              onTap: (){
                Navigator.of(context).pushNamed(SearchPage.path);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade200,
                // or suffix
                prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
          // 추천검색어
          Container(
            // color: Colors.red,
            // 크기 안잡으면 최대 크기로 간다.
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left:20.0, right: 20.0),
            child: Wrap(
              spacing: 20.0,
              children: ["검색어1", "검색어2", "검색어3", "검색어4", "검색어1", "검색어2", "검색어3", "검색어4"].map((String e) => MaterialButton(
                color: Colors.grey,
                  textColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () {

                  },
              child: Text(e))).toList(),
            ),
          ),
          SizedBox(height: 20.0),
          // 추천 상품
          Padding(
            padding: EdgeInsets.only(left:20.0, bottom: 10.0),
            child: Align(
              child:  Text("신상품"),
              alignment: Alignment.centerLeft,
            ),
          ),
          Container(
            height:300.0,
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left:20.0),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                // mainAxisExtent: 200,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => GridTile(
                child: Container(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );

  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
