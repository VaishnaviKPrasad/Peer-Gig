
abstract class FilterRepositoryBase {
  Future<List<String>> getAchievementsList(String? achievements);
  Future<List<String>> getAskMeABoutList(String? askMeAbout);
  Future<List<String>> getBranchList(String? branch);
  Future<List<String>> getCompanyList(String? company);
  Future<List<String>> getCourseList();
  Future<List<String>> getTechStackList(String? techStack);
  Future<List<int>> getYearList(String? year);

  Future<void> addAchievementInList(String? value);
  Future<void> addAskMeAboutInList(String? value);
  Future<void> addBranchInList(String? value);
  Future<void> addCompanyInList(String? value);
  Future<void> addCourseInList(String? value);
  Future<void> addTeckStackInList(String? value);
  Future<void> addYearInList(int? value);
}
