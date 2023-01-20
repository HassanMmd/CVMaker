import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/repository/repository.dart';
import '../networkResopnse.dart';

abstract class WorkExperienceRepository extends Repository{


  Future<NetworkResponse> addInfo(WorkExperience workExperience);

  Future<NetworkResponse<List<WorkExperience>>> getInfo();

  Future<NetworkResponse> deleteInfo(String id);

  Future<NetworkResponse> editInfo(WorkExperience workExperience);

}