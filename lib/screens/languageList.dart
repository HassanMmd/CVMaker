import 'package:cvmaker/screens/addLanguageSkills.dart';
import 'package:cvmaker/screens/languageInfo.dart';
import 'package:cvmaker/viewmodel/languageSkillsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({Key? key}) : super(key: key);

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddLanguageSkills()));
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
        title: const Text('Languages'),
      ),
      body: ListView(children: [
        Consumer<LanguageSkillsViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING) const CircularProgressIndicator(),
                if (x.status == Status.ERROR) const Text('Error loading'),
                Column(
                  children: x.languageSkills
                      .map(
                        (e) => LanguageInfo(e),
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
