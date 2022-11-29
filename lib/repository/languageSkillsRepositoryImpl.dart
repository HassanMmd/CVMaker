import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/repository/languageSkillsRepository.dart';
import 'package:http/http.dart' as http;

import '../networkResopnse.dart';

class LanguageSkillsRepositoryImpl extends LanguageSkillsRepository {
  @override
  Future<NetworkResponse> addInfo(LanguageSkills languageSkills) async {
    final response = await http.post(
      Uri.parse(
          'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/language'),
      body: jsonEncode(languageSkills.toMap()),
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
  Future<NetworkResponse<List<LanguageSkills>>> getInfo() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/language'));
    NetworkResponse<List<LanguageSkills>> result = NetworkResponse();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      result.success = true;
      result.data = data.map((e) => LanguageSkills.fromMap(e)).toList();
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
