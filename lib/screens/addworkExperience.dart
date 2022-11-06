import 'dart:ui';
import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class WorkExperienceScreen extends StatefulWidget {
  dynamic id;

  WorkExperienceScreen({this.id});

  // const WorkExperienceScreen({Key? key}) : super(key: key);

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState(id);
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  dynamic id;

  _WorkExperienceScreenState(this.id);

  String? role;
  String? company;
  String? start_date;
  String? end_date;
  bool current = true;
  String? details;

  NetworkResponse networkResponse = NetworkResponse();

  void onChanged(bool? vvv) {
    setState(() {
      current = vvv!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var workExperience = context.watch<WorkExperienceViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Experience',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    // textAlign: TextAlign.center,
                    onChanged: (value) {
                      role = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Role',
                      hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                  height: 10.0,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    // textAlign: TextAlign.center,
                    onChanged: (value) {
                      company = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Company',
                      hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                  height: 10.0,
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    // textAlign: TextAlign.center,
                    onChanged: (value) {
                      start_date = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Start date',
                      hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                  height: 10.0,
                ),
                Row(children: [
                  SizedBox(
                    width: 22.0,
                  ),
                  Checkbox(value: current, onChanged: onChanged),
                  Text('This is my current job')
                ]),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: TextField(
                    // textAlign: TextAlign.center,
                    onChanged: (value) {
                      end_date = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'End date',
                      hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                  height: 10.0,
                ),
                SizedBox(
                  height: 250,
                  width: 350,
                  child: TextField(
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: 10,
                    // textAlign: TextAlign.center,
                    onChanged: (value) {
                      details = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Details',
                      hintStyle: TextStyle(color: Color(0XFFC3BCBC)),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
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
                    SizedBox(
                      width: 30.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () async {
                        await workExperience.addWorkExperience(
                            WorkExperience(role!, company!, true, false,
                                start_date!, end_date!, details!, current),
                            id);
                      },
                      child: Text('Add'),
                    ),
                    SizedBox(
                      width: 200.0,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Cancel'))
                  ],
                ),
                if (workExperience.status == Status.LOADING)
                  CircularProgressIndicator(),
                if (workExperience.status == Status.ERROR)
                  Text('Bad connetion'),
                if (workExperience.status == Status.SUCCESS) Text('done'),
              ],
            ),
          ),
        ));
  }
}
