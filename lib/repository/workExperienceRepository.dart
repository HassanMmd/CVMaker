import 'package:cvmaker/modle/workExperience.dart';

abstract class WorkExperienceRepository {
  Future<void> addInfo(WorkExperience personalInfo);

  Future<List<WorkExperience>> getInfo();

  Future<void> deleteInfo(int id);

  Future<int> editInfo();
}