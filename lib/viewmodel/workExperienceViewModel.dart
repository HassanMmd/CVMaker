import 'package:cvmaker/repository/workExperienceRepositoryImpl.dart';
import 'package:flutter/cupertino.dart';

import '../model/workExperience.dart';
import '../networkResopnse.dart';

class WorkExperienceViewModel extends ChangeNotifier {
 var workExperienceImpl = WorkExperienceRepositoryImpl();

 Future<NetworkResponse> addInfo(WorkExperience workExperience) async{
   return workExperienceImpl.addInfo(workExperience);
 }

 Future<NetworkResponse> getInfo() async{
   return workExperienceImpl.getInfo();
 }

 Future<NetworkResponse> deleteInfo(int id) async{
   return deleteInfo(id);
 }

 Future<NetworkResponse> editInfo() async{
   return editInfo();
 }
}