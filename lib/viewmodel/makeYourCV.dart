import 'package:cvmaker/screens/educationList.dart';
import 'package:cvmaker/screens/workExperienceList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeYourCV extends StatelessWidget {
  const MakeYourCV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your CV'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WorkExperienceList()));
                },
                icon: const Icon(Icons.person),
                label: const Text('Personal Information')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EducationList()));
                },
                icon: const Icon(Icons.school),
                label: const Text('Education and Training')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WorkExperienceList()));
                },
                icon: const Icon(Icons.work),
                label: const Text('WorkExperience')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WorkExperienceList()));
                },
                icon: const Icon(Icons.wysiwyg),
                label: const Text('Courses And Projects')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WorkExperienceList()));
                },
                icon: const Icon(Icons.language),
                label: const Text('Language Skills')),
          ],
        ),
      ),
    );
  }
}
