import 'package:cvmaker/modle/languageSkills.dart';

abstract class LanguageSkillsRepository {
  Future<void> addInfo(LanguageSkills personalInfo);

  Future<List<LanguageSkills>> getInfo();

  Future<void> deleteInfo(int id);

  Future<int> editInfo();
}