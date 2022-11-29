import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/languageSkillsRepositoryImpl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';



enum Status { IDLE, SUCCESS, ERROR, LOADING }

class LanguageSkillsViewModel extends ChangeNotifier{
 final _auth=FirebaseAuth.instance;
 Status status=Status.IDLE;
 List<LanguageSkills> languageSkills=[];
 var languageSkillsImpl = LanguageSkillsRepositoryImpl();
 NetworkResponse? response;

 Future<NetworkResponse> deleteInfo(int id) async {
   return deleteInfo(id);
 }

 Future<NetworkResponse> editInfo() async {
   return editInfo();
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