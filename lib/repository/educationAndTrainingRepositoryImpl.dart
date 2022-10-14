import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/educationAndTraining.dart';
import 'package:cvmaker/repository/educationAndTrainingRepository.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class EducationAndTrainingRepositoryImpl
    implements EducationAndTrainingRepository {
  @override
  Future<void> addInfo(EducationAndTraining educationAndTraining) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(educationAndTraining.toMap()),
      );
      print('code ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Future deleteInfo(int id) async {
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
  Future<List<EducationAndTraining>> getInfo() async {
    final response = await http.get(Uri.parse(url));
    List<EducationAndTraining> empty = [];
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => EducationAndTraining.fromMap(e)).toList();
    } else {
      return empty;
    }
  }
}
