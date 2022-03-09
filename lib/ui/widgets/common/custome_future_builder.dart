import 'package:flutter/material.dart';
import 'package:peer_gig/ui/widgets/common/drop_down_button.dart';

// ignore: must_be_immutable
class CustomFutureBuilder extends StatelessWidget {
  Future<List<String>>? obj;
  String? txt;
  CustomFutureBuilder({ Key? key, required this.obj, required this.txt }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: obj,
      builder: (BuildContext context,
          AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
          //return const Text("Something went wrong");
        }
        if (snapshot.connectionState ==
                ConnectionState.done ||
            snapshot.hasData) {
          List<String> data = snapshot.data;
          return CustomDropDownButton(
              txt: txt!, fields: data, isfilter: false);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}