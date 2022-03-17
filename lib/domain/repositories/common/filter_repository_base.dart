abstract class FilterRepositoryBase {
  Future<List<String>> getAchievementsList();
  Future<List<String>> getAskMeAboutList();
  Future<List<String>> getBranchList();
  Future<List<String>> getCompanyList();
  Future<List<String>> getCourseList();
  Future<List<String>> getTechStackList();
  Future<List<String>> getYearList();

  Future<void> addAchievementInList(List<String?> value);
  Future<void> addAskMeAboutInList(List<String?> value);
  Future<void> addBranchInList(List<String?> value);
  Future<void> addCompanyInList(List<String?> value);
  Future<void> addCourseInList(List<String?> value);
  Future<void> addTeckStackInList(List<String?> value);
  Future<void> addYearInList(List<String?> value);
}
