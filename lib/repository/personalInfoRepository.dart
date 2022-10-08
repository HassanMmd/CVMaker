import '../modle/personalInfo.dart';

abstract class PersonalInfoRepository {
  Future<void> addInfo(PersonalInfo personalInfo);

  Future<PersonalInfo> getInfo();

  Future<int> deleteInfo(int id);

  Future<int> editInfo();
}
