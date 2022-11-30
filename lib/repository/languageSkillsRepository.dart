import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/repository/repository.dart';

import '../networkResopnse.dart';

abstract class LanguageSkillsRepository extends Repository{

  Future<NetworkResponse> addInfo(LanguageSkills languageSkills);

  Future<NetworkResponse<List<LanguageSkills>>> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}




