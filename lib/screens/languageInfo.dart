import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/screens/editLanguage.dart';
import 'package:cvmaker/viewmodel/languageSkillsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageInfo extends StatelessWidget {
  LanguageSkills language;

  LanguageInfo(this.language);

  @override
  Widget build(BuildContext context) {
    var languageViewModel = context.watch<LanguageSkillsViewModel>();

    return Column(
      children: [
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        if (language.level == 1)
                          const Text(
                            'Beginner',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        if (language.level == 2)
                          const Text(
                            'Intermediate',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        if (language.level == 3)
                          const Text(
                            'Advanced',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        if (language.level == 4)
                          const Text(
                            'Fluent',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditLanguage(language)));
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
                          languageViewModel.deleteInfo(language.id!);
                          languageViewModel.getLanguageSkills();
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
      ],
    );
  }
}
