import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/repository/personalInfoRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';

import '../networkResopnse.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class PersonalInfoViewModel extends ChangeNotifier {
  Status status = Status.IDLE;
  PersonalInfo? personalInfo;
  var personalInfoRepositoryImpl = PersonalInfoRepositoryImpl();
  NetworkResponse? response;

  Future<void> deleteInfo(String id) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await personalInfoRepositoryImpl.deleteInfo(id);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> editInfo(PersonalInfo personalInfo) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await personalInfoRepositoryImpl.editInfo(personalInfo);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  void getPersonalInfo() async {
    status = Status.LOADING;
    notifyListeners();
    var response = await personalInfoRepositoryImpl.getInfo();
    if (response.success) {
      status = Status.SUCCESS;
      print('response data  $response.data');
      personalInfo =
          response.data;
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> addPersonalInfo(PersonalInfo personalInfo) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await personalInfoRepositoryImpl.addInfo(personalInfo);
    if (response.success) {
      status = Status.SUCCESS;
      getPersonalInfo();
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }
}
