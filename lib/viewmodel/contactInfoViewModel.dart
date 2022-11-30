import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/contactInfoRepositoryImpl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum Status { IDLE, SUCCESS, ERROR, LOADING }

class ContactInfoViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Status status = Status.IDLE;
  List<ContactInfo> contactInfo = [];
  var contactInfoImpl = ContactInfoRepositoryImpl();
  NetworkResponse? response;

  Future<NetworkResponse> deleteInfo(int id) async {
    return deleteInfo(id);
  }

  Future<NetworkResponse> editInfo() async {
    return editInfo();
  }

  void addContactInfo(ContactInfo contactInfo) async {
    status = Status.LOADING;
    notifyListeners();
    var response = await contactInfoImpl.addInfo(contactInfo);
    if (response.success) {
      status = Status.SUCCESS;
      //get
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
}
