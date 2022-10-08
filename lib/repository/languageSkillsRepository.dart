import 'package:cvmaker/modle/languageSkills.dart';

abstract class LanguageSkillsRepository {
  Future<void> addInfo(LanguageSkills personalInfo);

  Future<LanguageSkills> getInfo();

  Future<int> deleteInfo(int id);

  Future<int> editInfo();
}