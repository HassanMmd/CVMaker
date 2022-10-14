import 'package:cvmaker/modle/educationAndTraining.dart';

abstract class EducationAndTrainingRepository {
  Future<void> addInfo(EducationAndTraining personalInfo);

  Future<List<EducationAndTraining>> getInfo();

  Future<void> deleteInfo(int id);

  Future<int> editInfo();
}