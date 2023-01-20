import 'package:cvmaker/screens/addPersonalInfo.dart';
import 'package:cvmaker/screens/personalInfo_Info.dart';
import 'package:cvmaker/viewmodel/personalInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfoList extends StatefulWidget {
  const PersonalInfoList({Key? key}) : super(key: key);

  @override
  State<PersonalInfoList> createState() => _PersonalInfoListState();
}

class _PersonalInfoListState extends State<PersonalInfoList> {
  @override
  Widget build(BuildContext context) {
    // var workExperience = context.watch<WorkExperienceViewModel>();
    // workExperience.getWorkExperience(widget.id);

    return Scaffold(
      appBar: AppBar(
        actions: [
          AspectRatio(
            aspectRatio: 2 / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0XFF56BB6C)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPersonalInfo()));
                },
                child: const Icon(
                  Icons.add,
                  size: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        title: const Text('Personal Information'),
      ),
      body: ListView(children: [
        Consumer<PersonalInfoViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING)
                  const CircularProgressIndicator(),
                if (x.status == Status.ERROR) const Text('Error'),
                if (x.status == Status.SUCCESS)
                  Column(children: [
                    if (x.personalInfo == null)
                      const Center(
                          child: Text(
                        'Please add your personal information',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )),
                    if (x.personalInfo != null)
                      PersonalInfoInfo(x.personalInfo),
                  ]),
                const SizedBox(
                  height: 10.0,
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
