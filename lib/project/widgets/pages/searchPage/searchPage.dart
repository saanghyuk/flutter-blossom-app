import 'package:blossom/project/models/routerObject/qsModel.dart';
import 'package:blossom/project/providers/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const String path = "/search";
  static Widget builder(QsModel model) => ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(model: model),
      child: SearchPage()
  );

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchProvider = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(_searchProvider.model.q.toString())
      ),
    );
  }
}
