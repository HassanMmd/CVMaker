import 'package:cvmaker/repository/workExperienceRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';
import '../model/workExperience.dart';
import '../networkResopnse.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class WorkExperienceViewModel extends ChangeNotifier {
  Status status = Status.IDLE;
  List<WorkExperience> workExperience = [];
  var workExperienceImpl = WorkExperienceRepositoryImpl();
  NetworkResponse? response;

  Future<void> deleteInfo(String id) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await workExperienceImpl.deleteInfo(id);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> editInfo(WorkExperience workExperience) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await workExperienceImpl.editInfo(workExperience);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }



  Future<void> getWorkExperience() async {
    status = Status.LOADING;
    notifyListeners();
    var response = await workExperienceImpl.getInfo();
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
      workExperience = response.data ?? [];
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> addWorkExperience(WorkExperience workExperience) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await workExperienceImpl.addInfo(workExperience);
    if (response.success) {
      status = Status.SUCCESS;
      getWorkExperience();
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }
}
