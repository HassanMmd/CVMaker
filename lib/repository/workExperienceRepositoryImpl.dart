import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/workExperience.dart';
import 'package:cvmaker/repository/workExperienceRepository.dart';
import 'package:http/http.dart' as http;
import 'package:cvmaker/networkResopnse.dart';

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  @override
  Future<NetworkResponse> addInfo(WorkExperience personalInfo) async {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(personalInfo.toMap()),
    );
    NetworkResponse resulte = NetworkResponse();
    if (response.statusCode == 200) {
      resulte.success = true;
      return resulte;
    } else {
      resulte.success = false;
      resulte.error = 'No connection';
      return resulte;
    }
  }

  @override
  Future<NetworkResponse> deleteInfo(int id) async {
    final response =
        await http.delete(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
    });
    NetworkResponse resulte = NetworkResponse();
    if (response.statusCode == 200) {
      resulte.success = true;
      return resulte;
    } else {
      resulte.success = false;
      resulte.error = 'No Connection';
      return resulte;
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
    NetworkResponse resulte = NetworkResponse();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      resulte.success = true;
      resulte.data = data.map((e) => WorkExperience.fromMap(e)).toList();
      return resulte;
    } else {
      resulte.success = false;
      resulte.error = 'No connection';
      return resulte;
    }
  }
}
