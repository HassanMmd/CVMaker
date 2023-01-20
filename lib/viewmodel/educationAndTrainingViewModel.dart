import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/educationAndTrainingRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class EducationAndTrainingViewModel extends ChangeNotifier {
  Status status = Status.IDLE;
  List<EducationAndTraining> educationAndTraining = [];
  var educationAndTrainingImpl = EducationAndTrainingRepositoryImpl();
  NetworkResponse? response;

  Future<void> deleteInfo(String id) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await educationAndTrainingImpl.deleteInfo(id);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
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

  Future<void> addEducationAndTraining(
      EducationAndTraining educationAndTraining) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await educationAndTrainingImpl.addInfo(educationAndTraining);
    if (response.success) {
      status = Status.SUCCESS;
      getEducationAndTraining();
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> editInfo(EducationAndTraining educationAndTraining) async {
    status = Status.LOADING;
    notifyListeners();
    var response =
        await educationAndTrainingImpl.editInfo(educationAndTraining);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }
}
