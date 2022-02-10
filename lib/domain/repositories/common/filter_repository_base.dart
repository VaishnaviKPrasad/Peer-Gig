import '../../entities/common/user.dart';

abstract class FilterRepositoryBase {
  Future<List<User>> getAchievementsList(String achievements);
  Future<List<User>> getAskMeABoutList(String askMeAbout);
  Future<List<User>> getBranchList(String branch);
  Future<List<User>> getCompanyList(String company);
  Future<List<User>> getCourseList(String course);
  Future<List<User>> getTechStackList(String techStack);
  Future<List<User>> getYearList(String year);

  Future<void> addAchievementInList(String value);
  Future<void> addAaskMeAboutInList(String value);
  Future<void> addBranchInList(String value);
  Future<void> addCompanyInList(String value);
  Future<void> addCourseInList(String value);
  Future<void> addTeckStackInList(String value);
  Future<void> addYearInList(String value);
}
