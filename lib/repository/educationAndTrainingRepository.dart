import 'package:cvmaker/modle/educationAndTraining.dart';

abstract class EducationAndTrainingRepository {
  Future<void> addInfo(EducationAndTraining personalInfo);

  Future<EducationAndTraining> getInfo();

  Future<int> deleteInfo(int id);

  Future<int> editInfo();
}