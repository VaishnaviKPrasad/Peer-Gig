import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/authentication/custom_multi_selector_field_widget.dart';

class CustomMultiSelectorFutureBuilder extends StatelessWidget {
  final Future<List<String>>? obj;
  final String? txt;
  final void Function(List<String?>, List<String?>) onSavedFunc;
  const CustomMultiSelectorFutureBuilder(
      {Key? key,
      required this.obj,
      required this.txt,
      required this.onSavedFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obj,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData) {
          List<String> data = snapshot.data;
          return CustomMultiSelectorFieldWidget(
            displayText: txt!,
            fields: data,
            onSavedFunc: onSavedFunc,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
