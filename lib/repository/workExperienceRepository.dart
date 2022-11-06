import 'package:cvmaker/authenticator.dart';
import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../networkResopnse.dart';

abstract class WorkExperienceRepository extends Repository{


  Future<NetworkResponse> addInfo(WorkExperience workExperience,dynamic idToken);

  Future<NetworkResponse<List<WorkExperience>>> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();

}