import 'package:cvmaker/modle/coursesAndProjects.dart';

abstract class CoursesAndProjectsRepository {
  Future<void> addInfo(CoursesAndProjects personalInfo);

  Future<CoursesAndProjects> getInfo();

  Future<int> deleteInfo(int id);

  Future<int> editInfo();
}
