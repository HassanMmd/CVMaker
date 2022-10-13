import 'package:cvmaker/modle/coursesAndProjects.dart';

abstract class CoursesAndProjectsRepository {
  Future<void> addInfo(CoursesAndProjects coursesAndProjects);

  Future<List<CoursesAndProjects>> getInfo();

  Future<int> deleteInfo(int id);
  // new commit
  Future<int> editInfo();
}
