import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/contactInfoRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class ContactInfoViewModel extends ChangeNotifier {
  Status status = Status.IDLE;
  List<ContactInfo> contactInfo = [];
  var contactInfoImpl = ContactInfoRepositoryImpl();
  NetworkResponse? response;

  Future<void> deleteInfo(String id) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await contactInfoImpl.deleteInfo(id);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }


  Future<void> addContactInfo(ContactInfo contactInfo) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await contactInfoImpl.addInfo(contactInfo);
    if (response.success) {
      status = Status.SUCCESS;
      getContactInfo();
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> getContactInfo() async {
    status = Status.LOADING;
    notifyListeners();
    var response = await contactInfoImpl.getInfo();
    if (response.success) {
      status = Status.SUCCESS;
      contactInfo = response.data ?? [];
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

  Future<void> editInfo(ContactInfo contactInfo) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await contactInfoImpl.editInfo(contactInfo);
    if (response.success) {
      status = Status.SUCCESS;
      print(response.data);
    } else {
      status = Status.ERROR;
    }
    notifyListeners();
  }

}
