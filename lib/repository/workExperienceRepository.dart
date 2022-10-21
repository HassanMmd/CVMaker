import 'package:cvmaker/model/workExperience.dart';

import '../networkResopnse.dart';

abstract class WorkExperienceRepository {
  Future<NetworkResponse> addInfo(WorkExperience workExperience);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}