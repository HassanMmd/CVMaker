import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/languageSkillsRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';



enum Status { IDLE, SUCCESS, ERROR, LOADING }

class LanguageSkillsViewModel extends ChangeNotifier{
 Status status=Status.IDLE;
 List<LanguageSkills> languageSkills=[];
 var languageSkillsImpl = LanguageSkillsRepositoryImpl();
 NetworkResponse? response;

 Future<void> deleteInfo(String id) async {
   status = Status.LOADING;
   notifyListeners();
   var response = await languageSkillsImpl.deleteInfo(id);
   if (response.success) {
     status = Status.SUCCESS;
     print(response.data);
   } else {
     status = Status.ERROR;
   }
   notifyListeners();
 }

 Future<void> editInfo(LanguageSkills languageSkills) async {
   status = Status.LOADING;
   notifyListeners();
   var response = await languageSkillsImpl.editInfo(languageSkills);
   if (response.success) {
     status = Status.SUCCESS;
     print(response.data);
   } else {
     status = Status.ERROR;
   }
   notifyListeners();
 }

 void getLanguageSkills() async{
   status=Status.LOADING;
   notifyListeners();
   var response = await languageSkillsImpl.getInfo();
   if(response.success){
     status=Status.SUCCESS;
     languageSkills=response.data??[];
   }
   else{
     status=Status.ERROR;
   }
   notifyListeners();
 }

 Future<void> addLanguageSkills(LanguageSkills languageSkills) async{
   status=Status.LOADING;
   notifyListeners();
   var response = await languageSkillsImpl.addInfo(languageSkills);
   if(response.success){
     status=Status.SUCCESS;
     getLanguageSkills();
   }
   else{
     status=Status.ERROR;
   }
   notifyListeners();
 }

}