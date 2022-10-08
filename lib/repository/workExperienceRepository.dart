import 'package:cvmaker/modle/workExperience.dart';

abstract class WorkExperienceRepository {
  Future<void> addInfo(WorkExperience personalInfo);

  Future<WorkExperience> getInfo();

  Future<int> deleteInfo(int id);

  Future<int> editInfo();
}