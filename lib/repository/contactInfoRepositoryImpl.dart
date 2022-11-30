import 'dart:convert';

import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/contactInfoRepository.dart';

class ContactInfoRepositoryImpl extends ContactInfoRepository {
  @override
  Future<NetworkResponse> addInfo(ContactInfo contactInfo) async {
    final response = await client.post(
      Uri.parse(
          'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/contact'),
      body: jsonEncode(contactInfo.toMap()),
    );
    NetworkResponse result = NetworkResponse();
    print(response.statusCode);
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    }
    else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> deleteInfo(int id) {
    // TODO: implement deleteInfo
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse> editInfo() {
    // TODO: implement editInfo
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<List<ContactInfo>>> getInfo() async {
    final response = await client.get(Uri.parse(
        'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/contact'));
    NetworkResponse<List<ContactInfo>> result =NetworkResponse();
    if(response.statusCode==200){
      List data = jsonDecode(response.body);
      result.success=true;
      result.data= data.map((e) => ContactInfo.fromMap(e)).toList();
      return result;
    }
    else{
      result.success=false;
      result.error='No connection';
      return result;
    }
  }
}
