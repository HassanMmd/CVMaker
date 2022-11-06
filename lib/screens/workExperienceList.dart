import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Text('Work Experience'),
        centerTitle: true,
      ),
      body: Column(children: [
        Consumer<WorkExperienceViewModel>(
          builder: (context, x, child) {
            return Column(children: [
              if (x.status == Status.LOADING) CircularProgressIndicator(),
              if (x.status == Status.ERROR) Text('Error loading'),
              Column(
                children: x.workExperience
                    .map(
                      (e) => Text(e.role),
                    )
                    .toList(),
              ),
              TextButton(
                  onPressed: () {
                    x.getWorkExperience();
                  },
                  child: Text('dfs'))
            ]);
          },
        ),
        // TextButton(
        //   onPressed: () {
        //     workExperience.getWorkExperience(widget.id);
        //   },
        //   child: Text('data'),
        // ),
        // if (workExperience.status == Status.LOADING)
        //   CircularProgressIndicator(),
        // if (workExperience.status == Status.ERROR) Text('Error loading'),
        // if (workExperience.status == Status.SUCCESS)
        //   Column(
        //     children:
        //         workExperience.workExperience.map((e) => Text(e.role)).toList(),
        //   ),
      ]),
    );
  }
}
