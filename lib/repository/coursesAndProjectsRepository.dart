import 'package:cvmaker/model/coursesAndProjects.dart';

import '../networkResopnse.dart';

abstract class CoursesAndProjectsRepository {
  Future<NetworkResponse> addInfo(CoursesAndProjects coursesAndProjects);

  Future<NetworkResponse> getInfo();

  Future<NetworkResponse> deleteInfo(int id);
  // new commit
  Future<NetworkResponse> editInfo();
}
