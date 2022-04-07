import 'package:flutter/material.dart';
import 'package:peer_gig/application/common/filter_app_service.dart';
import 'package:peer_gig/data/common/filter_repository.dart';
import 'package:peer_gig/ui/config/constants/gradient.dart';
import 'package:peer_gig/ui/widgets/common/custom_button.dart';
import 'package:peer_gig/ui/widgets/common/search_result_peer.dart';
import 'package:peer_gig/ui/widgets/common/search_tags_future_builder_component.dart';

class SearchAPeerScreen extends StatefulWidget {
  const SearchAPeerScreen({Key? key}) : super(key: key);

  @override
  State<SearchAPeerScreen> createState() => _SearchAPeerScreenState();
}

class _SearchAPeerScreenState extends State<SearchAPeerScreen> {
  FilterRepository obj = FilterRepository();

  String? _selectedAchievement;
  String? _selectedAskMeAbout;
  String? _selectedBranch;
  String? _selectedCompany;
  String? _selectedCourse;
  String? _selectedTechStack;
  String? _selectedYear;

  List<Map<String, Object?>> userData = [];

  void _getSelectedAchievement(String? val) {
    _selectedAchievement = val;
  }

  void _getSelectedAskMeAbout(String? val) {
    _selectedAskMeAbout = val;
  }

  void _getSelectedBranch(String? val) {
    _selectedBranch = val;
  }

  void _getSelectedCompany(String? val) {
    _selectedCompany = val;
  }

  void _getSelectedCourse(String? val) {
    _selectedCourse = val;
  }

  void _getSelectedTechStack(String? val) {
    _selectedTechStack = val;
  }

  void _getSelectedYear(String? val) {
    _selectedYear = val;
  }

  Future<void> _searchUsers() async {
    // the keys should be exactly the same as in the backend
    Map<String, String?> map = {
      'achievements': _selectedAchievement,
      'askMeAbout': _selectedAskMeAbout,
      'branch': _selectedBranch,
      'companies': _selectedCompany,
      'course': _selectedCourse,
      'techStacks': _selectedTechStack,
      'year': _selectedYear,
    };
    userData = await FilterAppService.searchUsers(map);
    print("#################### $userData");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppScreenGradient(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 20,
              children: [
                SearchTagsFutureBuilder(
                  list: obj.getAchievementsList(),
                  txt: "Achievements",
                  onChangedFunc: _getSelectedAchievement,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getAskMeAboutList(),
                  txt: "Ask Me About",
                  onChangedFunc: _getSelectedAskMeAbout,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getBranchList(),
                  txt: "Branch",
                  onChangedFunc: _getSelectedBranch,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getCompanyList(),
                  txt: "Company",
                  onChangedFunc: _getSelectedCompany,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getCourseList(),
                  txt: "Course",
                  onChangedFunc: _getSelectedCourse,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getTechStackList(),
                  txt: "Tech Stack",
                  onChangedFunc: _getSelectedTechStack,
                ),
                SearchTagsFutureBuilder(
                  list: obj.getYearList(),
                  txt: "Year",
                  onChangedFunc: _getSelectedYear,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              txt: "Apply Filters",
              onPressedFunc: _searchUsers,
            ),
            const SizedBox(height: 20),
            const Text("Your Search Results"),
            const SizedBox(height: 20),
            (userData.isEmpty)
                ? Text("Empty")
                : Expanded(
                    child: ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (_, index) {
                        return SearchResultPeer(
                          dpUrl: userData[index]['dpUrl']! as String,
                          title: userData[index]['title']! as String,
                          subtitle: userData[index]['subtitle']! as String,
                          userId: userData[index]['userId']! as String,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
