import 'package:cvmaker/repository/workExperienceRepositoryImpl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/workExperience.dart';
import '../networkResopnse.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class WorkExperienceViewModel extends ChangeNotifier {
  // final _auth = FirebaseAuth.instance;

  Status status = Status.IDLE;
  List<WorkExperience> workExperience = [];
  var workExperienceImpl = WorkExperienceRepositoryImpl();
  NetworkResponse? response;

  Future<NetworkResponse> deleteInfo(int id) async {
    return deleteInfo(id);
  }

  Future<NetworkResponse> editInfo() async {
    return editInfo();
  }

  void getWorkExperience() async {
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
