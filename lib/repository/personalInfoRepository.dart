import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/repository.dart';

import '../model/personalInfo.dart';

abstract class PersonalInfoRepository extends Repository {
  Future<NetworkResponse> addInfo(PersonalInfo personalInfo);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}
