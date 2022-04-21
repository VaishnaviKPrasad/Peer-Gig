import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/components/common/dp_username_display.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/custom_app_bar.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';

class AddAPostScreen extends StatefulWidget {
  const AddAPostScreen({ Key? key }) : super(key: key);

  @override
  State<AddAPostScreen> createState() => _AddAPostScreenState();
}

class _AddAPostScreenState extends State<AddAPostScreen> {
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