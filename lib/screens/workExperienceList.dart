import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/screens/addworkExperience.dart';
import 'package:cvmaker/screens/workExperienceInfo.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class WorkExperienceList extends StatefulWidget {
  @override
  State<WorkExperienceList> createState() => _WorkExperienceListState();
}

class _WorkExperienceListState extends State<WorkExperienceList> {
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
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0XFF56BB6C)),
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
        title: Text('Work Experience'),
      ),
      body: ListView(children: [
        Consumer<WorkExperienceViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING) CircularProgressIndicator(),
                if (x.status == Status.ERROR) Text('Error loading'),
                Column(
                  children: x.workExperience
                      .map(
                        (e) => WorkExperienceInfo(e),
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
