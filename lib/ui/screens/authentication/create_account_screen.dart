import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/authentication/custom_multi_selector_future_builder.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/custom_future_builder.dart';
import '../../widgets/authentication/custom_text_field.dart';
import '../../../data/common/filter_repository.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = '/createNewAccount';
  final String email;
  const CreateAccountScreen(this.email, {Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final FilterRepository obj = FilterRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();

  String? _validateFullName(String? val) {
    if (val == null || val.trim().isEmpty || val.trim().length > 30) {
      return "The value should be upto 30 characters.";
    }
    return null;
  }

  String? _validateDropDownFields(dynamic val) {
    print("########### Value Passed by drop down: $val");
    if (val == null) {
      return "This field is required";
    }
    return null;
  }

  void _onSubmitForm() {
    if (_formKey.currentState!.validate()) {}
  }

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
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          txt: 'Full Name',
                          maxLength: 30,
                          validatorFunc: _validateFullName,
                          textController: _fullNameController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Email Id',
                          textController: _emailController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Headline',
                          maxLength: 150,
                          textController: _headlineController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getCourseList(),
                          txt: 'Course',
                          validatorFunc: _validateDropDownFields,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getBranchList(),
                          txt: 'Branch',
                          validatorFunc: _validateDropDownFields,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getYearList(),
                          txt: 'Year',
                          validatorFunc: _validateDropDownFields,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getCompanyList(),
                          txt: 'Company',
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Experience',
                          maxLength: 2000,
                          textController: _experienceController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getAchievementsList(),
                          txt: 'Achievements',
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getTechStackList(),
                          txt: 'Tech-Stack',
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getAskMeAboutList(),
                          txt: 'Ask me About',
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'LinkedIn Profile',
                          textController: _linkedinController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Github Profile',
                          textController: _githubController,
                        ),
                        const SizedBox(height: 20.0),
                        CustomButton(
                          txt: 'Create Account',
                          onPressedFunc: _onSubmitForm,
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
