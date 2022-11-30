import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/repository/repository.dart';

import '../networkResopnse.dart';

abstract class ContactInfoRepository extends Repository{
  Future<NetworkResponse> addInfo(ContactInfo contactInfo);

  Future<NetworkResponse<List<ContactInfo>>> getInfo();

  Future<NetworkResponse> deleteInfo(int id);

  Future<NetworkResponse> editInfo();
}