import 'dart:convert';
import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/repository/personalInfoRepository.dart';
import 'package:cvmaker/networkResopnse.dart';

class PersonalInfoRepositoryImpl extends PersonalInfoRepository {
  @override
  Future<NetworkResponse> addInfo(PersonalInfo personalInfo) async {
    final response = await client.post(
      Uri.parse(
          '$baseUrl/personal'),
      body: jsonEncode(personalInfo.toMap()),
    );
    print(response.statusCode);
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> deleteInfo(String id) async {
    final response = await client.delete(
      Uri.parse(
          '$baseUrl/personal/$id'),
    );
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No Connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> editInfo(PersonalInfo personalInfo) async {
    final response = await client.put(
        Uri.parse(
            '$baseUrl/personal/${personalInfo.id}'),
        body: jsonEncode(personalInfo.toMap()));
    print(response.statusCode);
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse<PersonalInfo>> getInfo() async {
    final response = await client.get(Uri.parse(
        '$baseUrl/personal'));
    NetworkResponse<PersonalInfo> result = NetworkResponse();
    print('ggggettt ${response.statusCode}');
    if (response.statusCode == 200) {
      if(response.body.length>5) {
        var data = jsonDecode(response.body);
        result.data = PersonalInfo.fromMap(data);
        result.success = true;
        print(response.body);
        return result;
      }
      else{
        result.data=null;
        result.success=true;
        return result;
      }

    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
