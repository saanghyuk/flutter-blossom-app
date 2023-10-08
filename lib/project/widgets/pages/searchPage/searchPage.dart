import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:blossom/project/providers/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const String path = "/search";
  static Widget builder(QsModel model) => ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(model: model),
      child: SearchPage()
  );

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchProvider? _searchProvider;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    this._searchProvider = context.watch<SearchProvider>();
    this._textEditingController.text = this._searchProvider!.model.q ?? "";
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this._textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: this._textEditingController,
                      decoration:  InputDecoration(hintText: "검색"),
                    )),
                    IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                  ],
                )
            ),
            this._searchProvider!.model.q == null
                ? Expanded(child: Center(child: Text("...")))
                : Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0
                  ),
                  padding: EdgeInsets.all(20.0),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) => Container(color: Colors.blue),
                ))
          ],
        ),
      )
    );
  }
}
