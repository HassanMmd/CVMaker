import 'package:cvmaker/screens/addEducation.dart';
import 'package:cvmaker/screens/educationInfo.dart';
import 'package:cvmaker/viewmodel/educationAndTrainingViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EducationList extends StatefulWidget {
  const EducationList({Key? key}) : super(key: key);

  @override
  State<EducationList> createState() => _EducationListState();
}

class _EducationListState extends State<EducationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AspectRatio(
            aspectRatio: 2 / 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0XFF56BB6C)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddEducation()));
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
        title: Text('Work Experience'),
      ),
      body: ListView(children: [
        Consumer<EducationAndTrainingViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING) CircularProgressIndicator(),
                if (x.status == Status.ERROR) Text('Error loading'),
                Column(
                  children: x.educationAndTraining
                      .map(
                        (e) => EducationInfo(e),
                      )
                      .toList(),
                ),
                SizedBox(
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
