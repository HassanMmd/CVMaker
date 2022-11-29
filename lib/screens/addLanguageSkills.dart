import 'package:cvmaker/model/languageSkills.dart';
import 'package:cvmaker/viewmodel/languageSkillsViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> levelList = ['Beginner', 'Intermediate', 'Advanced', 'Fluent'];

class AddLanguageSkills extends StatefulWidget {
  const AddLanguageSkills({Key? key}) : super(key: key);

  @override
  State<AddLanguageSkills> createState() => _AddLanguageSkillsState();
}

class _AddLanguageSkillsState extends State<AddLanguageSkills> {
  String? name;
  int level = 0;

  String dropdownValue = levelList.first;

  @override
  Widget build(BuildContext context) {
    var language = context.watch<LanguageSkillsViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Language',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
                children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Add language*',
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
              SizedBox(
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
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFF568ABB)),
                      ),
                      onPressed: () async {
                        if (dropdownValue == 'Beginner') {
                          level = 1;
                        }
                        if (dropdownValue == 'Intermediate') {
                          level = 2;
                        }
                        if (dropdownValue == 'Advanced') {
                          level = 3;
                        }
                        if (dropdownValue == 'Fluent') {
                          level = 4;
                        }
                        if (name == null) {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 200.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Please fill all the fields',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 25.0),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  ),
                                );
                              });
                        } else {
                          print(level);
                          await language
                              .addLanguageSkills(LanguageSkills(name!, level));
                        }
                      },
                      child: Text('Add')),
                  SizedBox(
                    width: 200.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFFF22C2C)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
