import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/educationAndTraining.dart';
import 'package:cvmaker/repository/educationAndTrainingRepository.dart';
import 'package:http/http.dart' as http;
import '../networkResopnse.dart';

class EducationAndTrainingRepositoryImpl
    implements EducationAndTrainingRepository {
  @override
  Future<NetworkResponse> addInfo(
      EducationAndTraining educationAndTraining) async {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
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
  Future<NetworkResponse> getInfo() async {
    final response = await http.get(Uri.parse(url));
    NetworkResponse result = NetworkResponse();
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
