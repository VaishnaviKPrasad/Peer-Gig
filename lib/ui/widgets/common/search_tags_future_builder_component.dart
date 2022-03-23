import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_drop_down_button.dart';

class SearchTagsFutureBuilder extends StatelessWidget {
  final Future<List<String>>? list;
  final String txt;
  final void Function(String?)? onChangedFunc;

  const SearchTagsFutureBuilder({
    Key? key,
    required this.list,
    required this.txt,
    required this.onChangedFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData) {
          List<String> data = snapshot.data;
          return SearchTagsDropDown(
            txt: txt,
            fields: data,
            onChangedFunc: onChangedFunc,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
