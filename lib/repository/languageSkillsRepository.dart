import 'package:cvmaker/modle/languageSkills.dart';

import '../networkResopnse.dart';

abstract class LanguageSkillsRepository {
  Future<NetworkResponse> addInfo(LanguageSkills personalInfo);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}