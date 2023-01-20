import 'package:cvmaker/screens/addworkExperience.dart';
import 'package:cvmaker/screens/workExperienceInfo.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkExperienceList extends StatefulWidget {
  @override
  State<WorkExperienceList> createState() => _WorkExperienceListState();
}

class _WorkExperienceListState extends State<WorkExperienceList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          AspectRatio(
            aspectRatio: 2 / 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0XFF56BB6C)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WorkExperienceScreen()));
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
        title: const Text('Work Experience'),
      ),
      body: ListView(children: [
        Consumer<WorkExperienceViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING) const CircularProgressIndicator(),
                if (x.status == Status.ERROR) const Text('Error loading'),
                Column(
                  children: x.workExperience
                      .map(
                        (e) => WorkExperienceInfo(e),
                      )
                      .toList(),
                ),
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
