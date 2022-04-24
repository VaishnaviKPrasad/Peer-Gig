import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peer_gig/application/authentication/auth_app_service.dart';
import 'package:peer_gig/data/common/user_repository.dart';
import 'package:peer_gig/ui/config/constants/colors.dart';
import 'package:peer_gig/ui/config/constants/peer_gig_icons.dart';
import 'package:peer_gig/ui/widgets/common/custom_future_builder.dart';

class AccountDetails extends StatefulWidget {
  final String? txt;
  final bool? editable;
  final String? title;

  const AccountDetails(
      {Key? key,
      @required this.txt,
      @required this.editable,
      @required this.title})
      : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  final String? userId = AuthAppService().getEmailOfUser();
  late String txt;
  late TextEditingController _tc;
  late Map<String, Future<void> Function({String? userId, String? newVal})> map;
  final _userRepo = UserRepository();

  @override
  void initState() {
    txt = widget.txt!;
    _tc = TextEditingController(text: widget.txt);
    map = {
      'Headline': _userRepo.updateHeadline,
      'Course': _userRepo.updateCourse,
      'Branch': _userRepo.updateBranch,
      'Year': _userRepo.updateYear,
      'Company': _userRepo.addCompany,
      'Experiene': _userRepo.updateExperience,
      'Tech Stack': _userRepo.addTechStack,
      'Achievements': _userRepo.addAchievement,
      'Ask Me About': _userRepo.addAskMeAbout,
    };
    super.initState();
  }

  bool isDropDownAttribute(String attribute) {
    if (attribute == 'Course' || attribute == 'Branch' || attribute == 'Year') {
      return true;
    }
    return false;
  }

  bool isMultiSelectorAttribute(String attribute) {
    if (attribute == 'Company' ||
        attribute == 'Tech Stack' ||
        attribute == 'Achievements' ||
        attribute == 'Ask Me About') {
      return true;
    }
    return false;
  }

  void updateValue(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext bCtx) {
        return AlertDialog(
          title: Text("Update your ${widget.title}"),
          content: TextField(controller: _tc),
          actions: [
            TextButton(
              child: const Text("Update"),
              onPressed: () {
                map[widget.title]!(userId: userId, newVal: _tc.text);
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text("Update Successful!"),
                  ),
                );
                setState(() {
                  txt = _tc.text;
                });
                Navigator.pop(bCtx);
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(bCtx);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editable!) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColors.primaryDark!, width: 1.0),
          ),
          child: ListTile(
            tileColor: AppColors.primaryLight,
            onTap: () => (isDropDownAttribute(widget.title!) ||
                    isMultiSelectorAttribute(widget.title!))
                ? null
                : updateValue(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              widget.title!,
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              txt,
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark, fontSize: 18),
            ),
            trailing: Icon(PeerGigIcons.edit, color: AppColors.primaryDark),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColors.primaryDark!, width: 1.0),
          ),
          child: ListTile(
            tileColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              widget.title!,
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.txt!,
              style: GoogleFonts.mallanna(
                  color: AppColors.primaryDark, fontSize: 18),
            ),
          ),
        ),
      );
    }
  }
}
