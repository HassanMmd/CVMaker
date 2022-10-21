import 'package:cvmaker/model/educationAndTraining.dart';

import '../networkResopnse.dart';

abstract class EducationAndTrainingRepository {
  Future<NetworkResponse> addInfo(EducationAndTraining personalInfo);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}