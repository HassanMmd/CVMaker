import 'dart:convert';

import 'package:cvmaker/clientInterceptor.dart';
import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/repository/workExperienceRepository.dart';
import 'package:http/http.dart' as http;
import 'package:cvmaker/networkResopnse.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class WorkExperienceRepositoryImpl extends WorkExperienceRepository {


  @override
  Future<NetworkResponse<void>> addInfo(
      WorkExperience workExperience) async {
    final response = await client.post(
      Uri.parse(
          'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/experience'),

      body: jsonEncode(workExperience.toMap()),
    );
    print(response.statusCode);
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
  Future<NetworkResponse<List<WorkExperience>>> getInfo() async {
    final response = await client.get(
      Uri.parse(
          'https://us-central1-cv-builder-327dd.cloudfunctions.net/api/experience'),
    );
    NetworkResponse<List<WorkExperience>> resulte = NetworkResponse();
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
