import 'package:cvmaker/screens/editWorkExperience.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/workExperience.dart';
import '../viewmodel/workExperienceViewModel.dart';

class WorkExperienceInfo extends StatelessWidget {
  WorkExperience work;

  WorkExperienceInfo(this.work, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var workExperienceViewModel = context.watch<WorkExperienceViewModel>();
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
                        work.role,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '${work.start_date}-${work.end_date}',
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  work.company,
                  style: const TextStyle(
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    work.details!,
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
                            builder: (context) => EditWorkExperience(work)));
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
                        workExperienceViewModel.deleteInfo(work.id!);
                        workExperienceViewModel.getWorkExperience();
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
