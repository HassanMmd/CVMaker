import '../modle/personalInfo.dart';

abstract class PersonalInfoRepository {
  Future<void> addInfo(PersonalInfo personalInfo);

  Future<List<PersonalInfo>> getInfo();

  Future<void> deleteInfo(int id);

  Future<int> editInfo();
}
