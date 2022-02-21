
abstract class FilterRepositoryBase {
  Future<List<String>> getAchievementsList();
  Future<List<String>> getAskMeAboutList();
  Future<List<String>> getBranchList();
  Future<List<String>> getCompanyList();
  Future<List<String>> getCourseList();
  Future<List<String>> getTechStackList();
  Future<List<String>> getYearList();

  Future<void> addAchievementInList(String? value);
  Future<void> addAskMeAboutInList(String? value);
  Future<void> addBranchInList(String? value);
  Future<void> addCompanyInList(String? value);
  Future<void> addCourseInList(String? value);
  Future<void> addTeckStackInList(String? value);
  Future<void> addYearInList(int? value);
}
