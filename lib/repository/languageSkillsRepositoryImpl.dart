import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/repository/languageSkillsRepository.dart';

import '../networkResopnse.dart';

class LanguageSkillsRepositoryImpl extends LanguageSkillsRepository {
  @override
  Future<NetworkResponse> addInfo(LanguageSkills languageSkills) async {
    final response = await client.post(
      Uri.parse(
          '$baseUrl/language'),
      body: jsonEncode(languageSkills.toMap()),
    );
    NetworkResponse result = NetworkResponse();
    print(response.statusCode);
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
    final response =
        await client.delete(Uri.parse('$baseUrl/language/$id'),
        );
    NetworkResponse<List<LanguageSkills>> result = NetworkResponse();
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
  Future<NetworkResponse> editInfo(LanguageSkills languageSkills) async{
    final response = await client.put(
        Uri.parse(
            '$baseUrl/language/${languageSkills.id}'),
        body: jsonEncode(languageSkills.toMap()));
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
  Future<NetworkResponse<List<LanguageSkills>>> getInfo() async {
    final response = await client.get(Uri.parse(
        '$baseUrl/language'));
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
