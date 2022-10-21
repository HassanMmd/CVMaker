import 'package:cvmaker/networkResopnse.dart';

import '../model/personalInfo.dart';

abstract class PersonalInfoRepository {
  Future<NetworkResponse> addInfo(PersonalInfo personalInfo);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}
