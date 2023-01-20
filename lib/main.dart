import 'package:cvmaker/viewmodel/contactInfoViewModel.dart';
import 'package:cvmaker/viewmodel/educationAndTrainingViewModel.dart';
import 'package:cvmaker/viewmodel/languageSkillsViewModel.dart';
import 'package:cvmaker/viewmodel/makeYourCV.dart';
import 'package:cvmaker/viewmodel/personalInfoViewModel.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkExperienceViewModel>(create: (_) {
          var model = WorkExperienceViewModel();
          model.getWorkExperience();
          return model;
        }),
        ChangeNotifierProvider<EducationAndTrainingViewModel>(create: (_) {
          var model = EducationAndTrainingViewModel();
          model.getEducationAndTraining();
          return model;
        }),
        ChangeNotifierProvider<LanguageSkillsViewModel>(create: (_) {
          var model = LanguageSkillsViewModel();
          model.getLanguageSkills();
          return model;
        }),
        ChangeNotifierProvider<ContactInfoViewModel>(create: (_) {
          var model = ContactInfoViewModel();
          model.getContactInfo();
          return model;
        }),
        ChangeNotifierProvider<PersonalInfoViewModel>(create: (_) {
          var model = PersonalInfoViewModel();
          model.getPersonalInfo();
          return model;
        }),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0XFF343C39)),

          primarySwatch: Colors.blue,
        ),
        home: MakeYourCV(),
      ),
    );
  }
}
