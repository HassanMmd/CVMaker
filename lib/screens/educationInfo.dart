import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:cvmaker/screens/editEducation.dart';
import 'package:cvmaker/viewmodel/educationAndTrainingViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EducationInfo extends StatelessWidget {
  EducationAndTraining educationAndTraining;

  EducationInfo(this.educationAndTraining);

  @override
  Widget build(BuildContext context) {
    var educationViewModel = context.watch<EducationAndTrainingViewModel>();

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Card(
          color: const Color(0XFFF0F0F0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        educationAndTraining.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '${educationAndTraining.start_date}-${educationAndTraining.end_date}',
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  educationAndTraining.school,
                  style: const TextStyle(
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    educationAndTraining.country!,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditEducation(educationAndTraining)));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF568ABB)),
                      ),
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        educationViewModel.deleteInfo(educationAndTraining.id!);
                        educationViewModel.getEducationAndTraining();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFFF22C2C)),
                      ),
                      child: const Text('delete'),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
