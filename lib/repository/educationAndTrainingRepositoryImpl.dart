import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/repository/educationAndTrainingRepository.dart';
import '../networkResopnse.dart';

class EducationAndTrainingRepositoryImpl
    extends EducationAndTrainingRepository {
  @override
  Future<NetworkResponse> addInfo(
      EducationAndTraining educationAndTraining) async {
    final response = await client.post(
      Uri.parse(
          '$baseUrl/education'),
      body: jsonEncode(educationAndTraining.toMap()),
    );
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      print(response.statusCode);
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
          '$baseUrl/education/$id'),
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
  Future<NetworkResponse> editInfo(EducationAndTraining educationAndTraining) async{
    final response = await client.put(
        Uri.parse(
            '$baseUrl/education/${educationAndTraining.id}'),
        body: jsonEncode(educationAndTraining.toMap()));
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
  Future<NetworkResponse<List<EducationAndTraining>>> getInfo() async {
    final response = await client.get(Uri.parse(
        '$baseUrl/education'));
    NetworkResponse<List<EducationAndTraining>> result = NetworkResponse();
    if (response.statusCode == 200) {
      print(response.statusCode);
      List data = jsonDecode(response.body);
      result.success = true;
      result.data = data.map((e) => EducationAndTraining.fromMap(e)).toList();
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
