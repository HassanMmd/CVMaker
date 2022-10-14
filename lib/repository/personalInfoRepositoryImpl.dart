import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/personalInfo.dart';
import 'package:cvmaker/repository/personalInfoRepository.dart';
import 'package:http/http.dart' as http;

class PersonalInfoRepositoryImpl implements PersonalInfoRepository {
  @override
  Future<void> addInfo(PersonalInfo personalInfo) async {
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
  Future<List<PersonalInfo>> getInfo() async {
    final response = await http.get(Uri.parse(url));
    List<PersonalInfo> empty = [];
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => PersonalInfo.fromMap(e)).toList();
    } else {
      return empty;
    }
  }
}
