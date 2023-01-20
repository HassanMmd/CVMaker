import 'package:cvmaker/screens/contactInfoList.dart';
import 'package:cvmaker/screens/educationList.dart';
import 'package:cvmaker/screens/languageList.dart';
import 'package:cvmaker/screens/personalInfoList.dart';
import 'package:cvmaker/screens/workExperienceList.dart';
import 'package:cvmaker/viewmodel/contactInfoViewModel.dart';
import 'package:cvmaker/viewmodel/educationAndTrainingViewModel.dart';
import 'package:cvmaker/viewmodel/languageSkillsViewModel.dart';
import 'package:cvmaker/viewmodel/personalInfoViewModel.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakeYourCV extends StatelessWidget {
  const MakeYourCV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your CV'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent.shade100,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade50.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 80.0,
                    child: Icon(
                      Icons.description,
                      size: 70.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'My CV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<PersonalInfoViewModel>(
                          builder: (context, x, child) {
                            return Column(
                              children: [
                                Column(children: [
                                  if (x.personalInfo == null)
                                    const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 20.0,
                                    ),
                                  if (x.personalInfo != null)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                ]),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PersonalInfoList()));
                            },
                            icon: const Icon(Icons.person),
                            label: const Text('Personal Information')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<ContactInfoViewModel>(
                          builder: (context, x, child) {
                            return Column(
                              children: [
                                Column(children: [
                                  if (x.contactInfo.isEmpty)
                                    const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 20.0,
                                    ),
                                  if (x.contactInfo.isNotEmpty)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                ]),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ContactInfoList()));
                            },
                            icon: const Icon(Icons.contact_phone),
                            label: const Text('Contact Information')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<EducationAndTrainingViewModel>(
                          builder: (context, x, child) {
                            return Column(
                              children: [
                                Column(children: [
                                  if (x.educationAndTraining.isEmpty)
                                    const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 20.0,
                                    ),
                                  if (x.educationAndTraining.isNotEmpty)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                ]),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EducationList()));
                            },
                            icon: const Icon(Icons.school),
                            label: const Text('Education and Training')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<WorkExperienceViewModel>(
                          builder: (context, x, child) {
                            return Column(
                              children: [
                                Column(children: [
                                  if (x.workExperience.isEmpty)
                                    const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 20.0,
                                    ),
                                  if (x.workExperience.isNotEmpty)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                ]),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WorkExperienceList()));
                            },
                            icon: const Icon(Icons.work),
                            label: const Text('WorkExperience')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<LanguageSkillsViewModel>(
                          builder: (context, x, child) {
                            return Column(
                              children: [
                                Column(children: [
                                  if (x.languageSkills.isEmpty)
                                    const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 20.0,
                                    ),
                                  if (x.languageSkills.isNotEmpty)
                                    const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                ]),
                                const SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          },
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LanguageList()));
                            },
                            icon: const Icon(Icons.language),
                            label: const Text('Language Skills')),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(const Color(0XFF56BB6C)),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Build CV'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(Icons.wysiwyg)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
