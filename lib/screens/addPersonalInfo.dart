import 'package:cvmaker/model/personalInfo.dart';
import 'package:cvmaker/viewmodel/personalInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPersonalInfo extends StatefulWidget {
  const AddPersonalInfo({Key? key}) : super(key: key);

  @override
  State<AddPersonalInfo> createState() => _AddPersonalInfoState();
}

class _AddPersonalInfoState extends State<AddPersonalInfo> {
  String? name;
  String? brief;
  String? role;

  @override
  Widget build(BuildContext context) {
    var personal = context.watch<PersonalInfoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Personal Information',
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
                    name = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Name',
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
                height: 50,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    role = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Role',
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
                height: 100,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    brief = value;
                  },
                  maxLength: 50,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Brief',
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
                        if (name == null || brief == null || role == null) {
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
                          await personal.addPersonalInfo(
                              PersonalInfo(name!, role!, brief!));
                          Navigator.pop(context);
                        }
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
