import 'dart:convert';
import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/repository/workExperienceRepository.dart';
import 'package:cvmaker/networkResopnse.dart';
import '../const.dart';

class WorkExperienceRepositoryImpl extends WorkExperienceRepository {
  @override
  Future<NetworkResponse<void>> addInfo(WorkExperience workExperience) async {
    final response = await client.post(
      Uri.parse('$baseUrl/experience'),
      body: jsonEncode(workExperience.toMap()),
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
      Uri.parse('$baseUrl/experience/$id'),
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
  Future<NetworkResponse> editInfo(WorkExperience workExperience) async {
    final response = await client.put(
        Uri.parse('$baseUrl/experience/${workExperience.id}'),
        body: jsonEncode(workExperience.toMap()));
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
  Future<NetworkResponse<List<WorkExperience>>> getInfo() async {
    final response = await client.get(
      Uri.parse('$baseUrl/experience'),
    );
    NetworkResponse<List<WorkExperience>> result = NetworkResponse();
    if (response.statusCode == 200) {
      print(response.body);
      List data = jsonDecode(response.body);
      result.success = true;
      result.data = data.map((e) => WorkExperience.fromMap(e)).toList();
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
