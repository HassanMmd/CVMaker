import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/repository.dart';

import '../model/personalInfo.dart';

abstract class PersonalInfoRepository extends Repository {
  Future<NetworkResponse> addInfo(PersonalInfo personalInfo);

  Future<NetworkResponse<PersonalInfo>> getInfo();

  Future<NetworkResponse> deleteInfo(String id);

  Future<NetworkResponse> editInfo(PersonalInfo personalInfo);
}
