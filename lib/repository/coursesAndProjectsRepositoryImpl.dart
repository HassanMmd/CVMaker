import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/coursesAndProjects.dart';
import 'package:cvmaker/repository/coursesAndProjectsRepository.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:http/http.dart' as http;

class CoursesAndProjectsRepositoryImpl implements CoursesAndProjectsRepository {
  NetworkResponse requestResponse = NetworkResponse();

  @override
  Future<NetworkResponse> addInfo(CoursesAndProjects coursesAndProjects) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(coursesAndProjects.toMap()));
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = ' No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> deleteInfo(int id) async {
    final response =
        await http.delete(Uri.parse(baseUrl), headers: <String, String>{
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
    var response = await http.get(Uri.parse(baseUrl));
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      result.success = true;
      result.data = data.map((e) => CoursesAndProjects.fromMap(e)).toList();
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
