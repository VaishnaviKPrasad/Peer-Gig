import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/custome_future_builder.dart';
import '../../widgets/authentication/custom_text_field.dart';
import '../../../data/common/filter_repository.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/createNewAccount';
  final String email;
  const CreateAccount(this.email, {Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  FilterRepository obj = FilterRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const Image(
                    image: AssetImage(
                      'assets/images/add_profile_pic.png',
                    ),
                    alignment: Alignment.center,
                    height: 100.0,
                    width: 100.0,
                  ),
                  Text(
                    'Add Profile Pic',
                    style: GoogleFonts.mallanna(
                      color: AppColors.primaryLight,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Form(
                      child: Column(
                    children: [
                      const CustomTextField(
                        txt: 'Full Name',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'Email Id',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'Password',
                        password: true,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'Headline',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getCourseList(), txt: 'Course',),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getBranchList(), txt: 'Branch',),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getYearList(), txt: 'Year',),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getCompanyList(), txt: 'Course',),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'Experience',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getAchievementsList(), txt: 'Achievements',),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getTechStackList(), txt: 'Tech-Stack',),
                      const SizedBox(height: 20.0),
                      CustomFutureBuilder(obj: obj.getAskMeAboutList(), txt: 'Ask me About',),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'LinkedIn Profile',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        txt: 'Github Profile',
                        password: false,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomButton(txt: 'Create Account'),
                      const SizedBox(height: 20.0),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
