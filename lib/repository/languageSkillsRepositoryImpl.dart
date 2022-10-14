import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/languageSkills.dart';
import 'package:cvmaker/repository/languageSkillsRepository.dart';
import 'package:http/http.dart' as http;

class LanguageSkillsRepositoryImpl implements LanguageSkillsRepository {
  @override
  Future<void> addInfo(LanguageSkills languageSkills) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(languageSkills.toMap()),
      );
      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> deleteInfo(int id) async {
    final response =
        await http.delete(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json',
    });
  }

  @override
  Future<int> editInfo() {
    // TODO: implement editInfo
    throw UnimplementedError();
  }

  @override
  Future<List<LanguageSkills>> getInfo() async {
    final response = await http.get(Uri.parse(url));
    List<LanguageSkills> empty = [];
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => LanguageSkills.fromMap(e)).toList();
    } else {
      return empty;
    }
  }
}
