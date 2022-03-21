import 'package:flutter/material.dart';
import '../../../data/common/filter_repository.dart';
import '../../widgets/common/custom_future_builder.dart';

// ignore: must_be_immutable
class SearchFilterTags extends StatefulWidget {
  
  final List<String?> companyList;
  final List<String?> companyTags;
  final List<String?> achievementsList;
  final List<String?> achievementsTags;
  final List<String?> techStackList;
  final List<String?> techStackTags;
  final List<String?> askMeAboutList;
  final List<String?> askMeAboutTags;
  
  const SearchFilterTags({Key? key, 
  required this.companyList, 
  required this.companyTags, 
  required this.achievementsList, 
  required this.achievementsTags, 
  required this.techStackList, 
  required this.techStackTags, 
  required this.askMeAboutList, 
  required this.askMeAboutTags}) : super(key: key);

  @override
    _SearchFilterTags createState() =>
      _SearchFilterTags();
}

class _SearchFilterTags extends State<SearchFilterTags>{
  final FilterRepository obj = FilterRepository();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
            CustomFutureBuilder(
                          obj: obj.getBranchList(),
                          txt: 'Branch',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),
            CustomFutureBuilder(
                          obj: obj.getCourseList(),
                          txt: 'Course',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),
            CustomFutureBuilder(
                          obj: obj.getYearList(),
                          txt: 'Year',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CustomFutureBuilder(
                          obj: obj.getAchievementsList(),
                          txt: 'Achievements',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),
            CustomFutureBuilder(
                          obj: obj.getAskMeAboutList(),
                          txt: 'Ask Me About',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, children:[
            CustomFutureBuilder(
                          obj: obj.getCompanyList(),
                          txt: 'Company',
                          validatorFunc: ,
                          onSavedFunc: ,
                        ),
            CustomFutureBuilder(
                          obj: obj.getTechStackList(),
                          txt: 'Teck Stack',
                          validatorFunc: ,
                          onSavedFunc: ,
                        )])]);
  }
}
