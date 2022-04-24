import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/application/common/user_app_service.dart';
import 'package:peer_gig/application/resource_sharing/post_app_service.dart';
import 'package:peer_gig/data/common/user_repository.dart';
=======
>>>>>>> f9132829d82a4b6e4eef12733f79499fc90c0950
import 'package:peer_gig/ui/components/common/dp_username_display.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';

class AddAPostScreen extends StatefulWidget {
<<<<<<< HEAD
  static const routeName = '/addAPostScreen';
  const AddAPostScreen({Key? key}) : super(key: key);
=======
  const AddAPostScreen({ Key? key }) : super(key: key);
>>>>>>> f9132829d82a4b6e4eef12733f79499fc90c0950

  @override
  State<AddAPostScreen> createState() => _AddAPostScreenState();
}

class _AddAPostScreenState extends State<AddAPostScreen> {
<<<<<<< HEAD
  final TextEditingController _tc = TextEditingController();
  String? userId = AuthAppService().getEmailOfUser();

  Future<Map<String, String>> getUserInfo() async {
    Map<String, String> userInfo = {
      'dpUrl': await UserRepository().getDpUrl(userId!),
      'fullName': await UserRepository().getFullName(userId!),
    };
    return userInfo;
  }

  void addPost() async {
    Map<String, Object> postDetails = {
      'body': _tc.text,
      'date': DateTime.now(),
      'postedBy': userId!,
    };
    await PostAppService().addPost(userId!, postDetails);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Post Added!"),
      ),
    );
    Navigator.pop(context);
  }

=======
>>>>>>> f9132829d82a4b6e4eef12733f79499fc90c0950
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(txt: "ADD POST"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Padding(
<<<<<<< HEAD
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: getUserInfo(),
                    builder: (BuildContext ctx,
                        AsyncSnapshot<Map<String, String>> snapshot) {
                      if (snapshot.hasData) {
                        var dpUrl = snapshot.data!['dpUrl'];
                        var fullName = snapshot.data!['fullName'];
                        return DpUsernameDisplay(
                            dpUrl: dpUrl, username: fullName);
                      }

                      if (snapshot.hasError) {
                        return Text("Error ${snapshot.error}");
                      }

                      return const CircularProgressIndicator();
                    }),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _tc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    label: Text(
                      "Add a Post...",
                      style: GoogleFonts.mallanna(
                        color: AppColors.text,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    labelStyle: GoogleFonts.mallanna(
                      color: AppColors.primaryDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    filled: true,
                    fillColor: AppColors.highlightColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryDark!,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryDark!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryDark!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  txt: 'Post',
                  onPressedFunc: () {
                    addPost();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
=======
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const DpUsernameDisplay(
                    dpUrl: "https://t4.ftcdn.net/jpg/02/79/66/93/360_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg",
                    username: "Samridhi Sethi"
                  ),
                  const SizedBox(height: 10,),
                  TextField(
                      maxLines: null,
                      minLines: 10,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        isDense: true,
                        label: Text(
                          "Add a Post...",
                          style: GoogleFonts.mallanna(
                            color: AppColors.text,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),                      
                          textAlign: TextAlign.left,
                        ),
                        labelStyle: GoogleFonts.mallanna(
                          color: AppColors.primaryDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                        filled: true,
                        fillColor: AppColors.highlightColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryDark!,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryDark!,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryDark!,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  CustomButton(
                    txt: 'Post', 
                    onPressedFunc: () {  },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
>>>>>>> f9132829d82a4b6e4eef12733f79499fc90c0950
