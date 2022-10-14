import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/workExperience.dart';
import 'package:cvmaker/repository/workExperienceRepository.dart';
import 'package:http/http.dart' as http;

class WorkExperienceRepositoryImpl implements WorkExperienceRepository {
  @override
  Future<void> addInfo(WorkExperience personalInfo) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(personalInfo.toMap()),
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
  Future<List<WorkExperience>> getInfo() async {
    final response = await http.get(Uri.parse(url));
    List<WorkExperience> empty = [];
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => WorkExperience.fromMap(e)).toList();
    } else {
      return empty;
    }
  }
}
