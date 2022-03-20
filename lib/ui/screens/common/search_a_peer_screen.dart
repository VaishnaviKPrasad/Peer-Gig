import 'package:flutter/material.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';

class SearchAPeerScreen extends StatefulWidget {
  const SearchAPeerScreen({ Key? key }) : super(key: key);

  @override
  State<SearchAPeerScreen> createState() => _SearchAPeerScreenState();
}

class _SearchAPeerScreenState extends State<SearchAPeerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Search A Peer Screen"),
          ],
        ),
      ),
    );
  }
}
