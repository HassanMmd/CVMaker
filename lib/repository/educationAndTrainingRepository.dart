import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/repository/repository.dart';

import '../networkResopnse.dart';

abstract class EducationAndTrainingRepository extends Repository{


  Future<NetworkResponse> addInfo(EducationAndTraining educationAndTraining);

  Future<NetworkResponse<List<EducationAndTraining>>> getInfo();

  Future<NetworkResponse> deleteInfo(String id);

  Future<NetworkResponse> editInfo(EducationAndTraining educationAndTraining);
}