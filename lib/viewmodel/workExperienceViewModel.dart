import 'package:cvmaker/repository/workExperienceRepositoryImpl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../model/workExperience.dart';
import '../networkResopnse.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class WorkExperienceViewModel extends ChangeNotifier {

  final _auth = FirebaseAuth.instance;


  Status status = Status.IDLE;
  List<WorkExperience> workExperience = [];
  var workExperienceImpl = WorkExperienceRepositoryImpl();
  NetworkResponse? response;

  Future<NetworkResponse> addInfo(
      WorkExperience workExperience, dynamic idToken) async {
    return workExperienceImpl.addInfo(workExperience, idToken);
  }

  Future<NetworkResponse<List<WorkExperience>>> getInfo(dynamic idToken) async {
    return workExperienceImpl.getInfo();
  }

  Future<NetworkResponse> deleteInfo(int id) async {
    return deleteInfo(id);
  }

  Future<NetworkResponse> editInfo() async {
    return editInfo();
  }

  void getWorkExperience() async {
    status = Status.LOADING;
    notifyListeners();
    var id = await getIDToken();
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

  Future<void> addWorkExperience(WorkExperience workExperience, dynamic idToken) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await workExperienceImpl.addInfo(workExperience, idToken);
    if (response.success) {
      status = Status.SUCCESS;
    }
    else
      {
        status=Status.ERROR;
      }
    notifyListeners();
  }

  Future<String> getIDToken() async{
    if(_auth.currentUser==null){
    await  _auth.signInAnonymously();
    }
    return await _auth.currentUser!.getIdToken();
  }
}
