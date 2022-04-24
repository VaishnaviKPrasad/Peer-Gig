import 'package:flutter/material.dart';
import 'package:peer_gig/application/common/user_app_service.dart';
import 'package:peer_gig/ui/components/common/account_profile.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/account_details.dart';

class PeerAboutTabScreen extends StatefulWidget {
  final String? userId;
  const PeerAboutTabScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<PeerAboutTabScreen> createState() => _PeerAboutTabScreenState();
}

class _PeerAboutTabScreenState extends State<PeerAboutTabScreen> {
  final List<String> _attributes = [
    'Headline',
    'Course',
    'Branch',
    'Year',
    'Company',
    'Experiene',
    'Tech Stack',
    'Achievements',
    'Ask Me About'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            FutureBuilder(
              future: UserAppService.getUserDetails(widget.userId!),
              builder: (BuildContext ctx,
                  AsyncSnapshot<Map<String, String>> snapshot) {
                if (snapshot.hasData) {
                  return AccountProfile(
                    peerId: widget.userId,
                    dpUrl: snapshot.data!['dpUrl'],
                    username: snapshot.data!['fullName'],
                    followerCount: snapshot.data!['followersCount'],
                    followingCount: snapshot.data!['followingsCount'],
                    isMyAccount: false,
                    isFollowing: (snapshot.data!['isFollowing'] == "True")
                        ? true
                        : false,
                  );
                }

                if (snapshot.hasError) {
                  return Text("###### Error: ${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: FutureBuilder(
                future: UserAppService.getUserAttributesInfo(widget.userId!),
                builder: (BuildContext ctx,
                    AsyncSnapshot<Map<String, String>> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: 9,
                      itemBuilder: (BuildContext cntx, int index) {
                        String title = _attributes[index];
                        String txt = data[title] ?? "None";
                        return Column(
                          children: [
                            AccountDetails(
                                txt: txt, editable: false, title: title),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        );
                      },
                    );
                  }

                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
ListView.builder(
                    //shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: const [
                          AccountDetails(
                              txt: "Lorem ipsum dolor sit amet, consectetur",
                              editable: false,
                              title: "Achievements"),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      );
                    },
                  ),
                  */