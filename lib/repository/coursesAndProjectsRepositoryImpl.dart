import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/modle/coursesAndProjects.dart';
import 'package:cvmaker/repository/coursesAndProjectsRepository.dart';
import 'package:http/http.dart' as http;

class CoursesAndProjectsRepositoryImpl implements CoursesAndProjectsRepository {
  @override
  Future<void> addInfo(CoursesAndProjects coursesAndProjects) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(coursesAndProjects.toMap()));
      print('code ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<int> deleteInfo(int id) {
    // TODO: implement deleteInfo
    throw UnimplementedError();
  }

  @override
  Future<int> editInfo() {
    // TODO: implement editInfo
    throw UnimplementedError();
  }

  @override
  Future<List<CoursesAndProjects>> getInfo() async{
    var response= await http.get(Uri.parse(url));
    List<CoursesAndProjects> coursersAndProjects=[];
    if(response.statusCode==200){
      List data = jsonDecode(response.body);
      return data.map((e) => CoursesAndProjects.fromMap(e)).toList();
    }
    else{
      return coursersAndProjects;
    }
  }
}
