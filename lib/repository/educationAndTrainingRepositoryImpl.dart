import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/repository/educationAndTrainingRepository.dart';
import 'package:http/http.dart' as http;
import '../networkResopnse.dart';

class EducationAndTrainingRepositoryImpl
    extends EducationAndTrainingRepository {
  @override
  Future<NetworkResponse> addInfo(
      EducationAndTraining educationAndTraining) async {
    final response = await client.post(
      Uri.parse(
          'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/education'),
      body: jsonEncode(educationAndTraining.toMap()),
    );
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
  Future<NetworkResponse> deleteInfo(int id) async {
    final response =
        await http.delete(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
    });
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
  Future<NetworkResponse> editInfo() {
    // TODO: implement editInfo
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<List<EducationAndTraining>>> getInfo() async {
    final response = await client.get(Uri.parse(
        'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/education'));
    NetworkResponse<List<EducationAndTraining>> result = NetworkResponse();
    if (response.statusCode == 200) {
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
