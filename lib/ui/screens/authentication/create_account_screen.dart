import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/application/common/user_app_service.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/authentication/custom_multi_selector_future_builder.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/custom_future_builder.dart';
import 'package:peer_gig/ui/widgets/common/custom_text_display.dart';
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

  late String? _dpUrl;
  late String? _fullName;
  late String? _headline;
  late String? _course;
  late String? _branch;
  late String? _year;
  late String? _experience;
  late List<String?> _companyList;
  late List<String?> _companyTags;
  late List<String?> _achievementsList;
  late List<String?> _achievementsTags;
  late List<String?> _techStackList;
  late List<String?> _techStackTags;
  late List<String?> _askMeAboutList;
  late List<String?> _askMeAboutTags;
  late String? _linkedIn;
  late String? _github;

  final TextEditingController _fullNameController = TextEditingController();
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

  String? _validateDropDownFields(String? val) {
    if (val == null) {
      return "This field is required";
    }
    return null;
  }

  void _saveFullName(String? val) {
    _fullName = val;
  }

  void _saveHeadline(String? val) {
    _headline = val;
  }

  void _saveCourse(String? val) {
    _course = val;
  }

  void _saveBranch(String? val) {
    _branch = val;
  }

  void _saveYear(String? val) {
    _year = val;
  }

  void _saveExperience(String? val) {
    _experience = val;
  }

  void _saveCompanyList(List<String?> val, List<String?> companyTags) {
    _companyList = val;
    _companyTags = companyTags;
  }

  void _saveAchievementsList(List<String?> val, List<String?> achievementTags) {
    _achievementsList = val;
    _achievementsTags = achievementTags;
  }

  void _saveAskMeAboutList(List<String?> val, List<String?> askMeAboutTags) {
    _askMeAboutList = val;
    _askMeAboutTags = askMeAboutTags;
  }

  void _saveTechStackList(List<String?> val, List<String?> techStackTags) {
    _techStackList = val;
    _techStackTags = techStackTags;
  }

  void _saveLinkedIn(String? val) {
    _linkedIn = val;
  }

  void _saveGithub(String? val) {
    _github = val;
  }

  void _onSubmitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _dpUrl = null;
      Map<String, Object?> inputDetailsByUser = {};
      inputDetailsByUser['dpUrl'] = _dpUrl;
      inputDetailsByUser['fullName'] = _fullName;
      inputDetailsByUser['headline'] = _headline;
      inputDetailsByUser['course'] = _course;
      inputDetailsByUser['branch'] = _branch;
      inputDetailsByUser['year'] = _year;
      inputDetailsByUser['experience'] = _experience;
      inputDetailsByUser['companies'] = _companyList;
      inputDetailsByUser['achievements'] = _achievementsList;
      inputDetailsByUser['techStacks'] = _techStackList;
      inputDetailsByUser['askMeAbout'] = _askMeAboutList;
      inputDetailsByUser['linkedIn'] = _linkedIn;
      inputDetailsByUser['github'] = _github;
      UserAppService.addUser(
        inputDetailsByUser: inputDetailsByUser,
        context: context,
        companyTags: _companyTags,
        askMeAboutTags: _askMeAboutTags,
        achievementsTags: _achievementsTags,
        techStackTags: _techStackTags,
      );
    }
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
                          onSavedFunc: _saveFullName,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextDisplay(
                          txt: AuthAppService().getEmailOfUser(),
                          isSelector: false,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Headline',
                          maxLength: 150,
                          textController: _headlineController,
                          onSavedFunc: _saveHeadline,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getCourseList(),
                          txt: 'Course',
                          validatorFunc: _validateDropDownFields,
                          onSavedFunc: _saveCourse,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getBranchList(),
                          txt: 'Branch',
                          validatorFunc: _validateDropDownFields,
                          onSavedFunc: _saveBranch,
                        ),
                        const SizedBox(height: 20.0),
                        CustomFutureBuilder(
                          obj: obj.getYearList(),
                          txt: 'Year',
                          validatorFunc: _validateDropDownFields,
                          onSavedFunc: _saveYear,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getCompanyList(),
                          txt: 'Company',
                          onSavedFunc: _saveCompanyList,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Experience',
                          maxLength: 2000,
                          textController: _experienceController,
                          onSavedFunc: _saveExperience,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getAchievementsList(),
                          txt: 'Achievements',
                          onSavedFunc: _saveAchievementsList,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getTechStackList(),
                          txt: 'Tech-Stack',
                          onSavedFunc: _saveTechStackList,
                        ),
                        const SizedBox(height: 20.0),
                        CustomMultiSelectorFutureBuilder(
                          obj: obj.getAskMeAboutList(),
                          txt: 'Ask me About',
                          onSavedFunc: _saveAskMeAboutList,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'LinkedIn Profile',
                          textController: _linkedinController,
                          onSavedFunc: _saveLinkedIn,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextField(
                          txt: 'Github Profile',
                          textController: _githubController,
                          onSavedFunc: _saveGithub,
                        ),
                        const SizedBox(height: 20.0),
                        CustomButton(
                          txt: 'Create Account',
                          onPressedFunc: () => _onSubmitForm(context),
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
