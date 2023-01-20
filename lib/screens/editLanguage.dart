import 'package:cvmaker/model/languageSkills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/languageSkillsViewModel.dart';

List<String> levelList = ['Beginner', 'Intermediate', 'Advanced', 'Fluent'];

class EditLanguage extends StatefulWidget {
  LanguageSkills? languageSkills;

  EditLanguage(this.languageSkills, {Key? key}) : super(key: key);

  @override
  State<EditLanguage> createState() => _EditLanguageState();
}

class _EditLanguageState extends State<EditLanguage> {
  String? name;
  int level = 0;

  String dropdownValue = levelList.first;

  @override
  Widget build(BuildContext context) {
    var language = context.watch<LanguageSkillsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Language',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.languageSkills?.name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Edit language*',
                    hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF568ABB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF568ABB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: levelList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF568ABB)),
                      ),
                      onPressed: () async {
                        if (dropdownValue == 'Beginner') {
                          widget.languageSkills?.level = 1;
                        }
                        if (dropdownValue == 'Intermediate') {
                          widget.languageSkills?.level = 2;
                        }
                        if (dropdownValue == 'Advanced') {
                          widget.languageSkills?.level = 3;
                        }
                        if (dropdownValue == 'Fluent') {
                          widget.languageSkills?.level = 4;
                        }
                        print(level);
                        await language.editInfo(widget.languageSkills!);
                        Navigator.pop(context);
                      },
                      child: const Text('Add')),
                  const SizedBox(
                    width: 200.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFFF22C2C)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
