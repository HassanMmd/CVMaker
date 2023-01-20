import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/screens/editPersonalInfo.dart';
import 'package:cvmaker/viewmodel/personalInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInfoInfo extends StatelessWidget {
  PersonalInfo? personalInfo;

  PersonalInfoInfo(this.personalInfo, {Key? key}) : super(key: key);

  String? name;
  String? role;
  String? brief;

  @override
  Widget build(BuildContext context) {
    var personalInfoViewModel = context.watch<PersonalInfoViewModel>();

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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              if (personalInfo != null)
                                Text(
                                  name = personalInfo!.name,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Role',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              if (personalInfo != null)
                                Text(
                                  role = personalInfo!.role,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Brief',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              if (personalInfo != null)
                                Text(
                                  brief = personalInfo!.brief,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                            ],
                          ),
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditPersonalInfo(personalInfo)));
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
                          personalInfoViewModel.deleteInfo(personalInfo!.id!);
                          personalInfoViewModel.getPersonalInfo();
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
                ]),
          ),
        ),
      ),
    ]);
  }
}
