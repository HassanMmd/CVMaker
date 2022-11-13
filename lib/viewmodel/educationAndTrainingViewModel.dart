import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/educationAndTrainingRepositoryImpl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class EducationAndTrainingViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Status status = Status.IDLE;
  List<EducationAndTraining> educationAndTraining = [];
  var educationAndTrainingImpl = EducationAndTrainingRepositoryImpl();
  NetworkResponse? response;

  Future<NetworkResponse> deleteInfo(int id) async {
    return deleteInfo(id);
  }

  Future<NetworkResponse> editInfo() async {
    return editInfo();
  }

  void getEducationAndTraining() async {
    status = Status.LOADING;
    notifyListeners();
    var response = await educationAndTrainingImpl.getInfo();
    if (response.success) {
      status = Status.SUCCESS;
      educationAndTraining = response.data ?? [];
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> addEducationAndTraining() async {
    status = Status.LOADING;
    notifyListeners();
    var response = await educationAndTrainingImpl.getInfo();
    if (response.success) {
      status = Status.SUCCESS;
      getEducationAndTraining();
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }
}
