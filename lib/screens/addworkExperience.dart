import 'dart:ui';
import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WorkExperienceScreen extends StatefulWidget {
  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  TextEditingController dateInputStartDate = TextEditingController();
  TextEditingController dateInputEndDate = TextEditingController();

  @override
  void initState() {
    dateInputStartDate.text = '';
    dateInputEndDate.text = '';
    super.initState();
  }

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
            child: Padding(
              padding: EdgeInsets.all(10.0),
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
                        hintText: 'Role*',
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
                        hintText: 'Company*',
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
                      controller: dateInputStartDate,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInputStartDate.text = formattedDate;
                            start_date = dateInputStartDate.text;
                            //set output date to TextField value.
                          });
                        } else {}
                      },
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        start_date = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: 'Start date*',
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
                      width: 10.0,
                    ),
                    Checkbox(
                      value: current,
                      onChanged: onChanged,
                      fillColor: MaterialStateProperty.all(Colors.green),
                    ),
                    Text('This is my current job')
                  ]),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      controller: dateInputEndDate,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInputEndDate.text = formattedDate;
                            end_date = dateInputEndDate.text;
                            //set output date to TextField value.
                          });
                        } else {}
                      },
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        end_date = value;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        hintText: 'End date*',
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
                        hintText: 'Details*',
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
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0XFF568ABB)),
                        ),
                        onPressed: () async {
                          if (role == null ||
                              company == null ||
                              start_date == null ||
                              end_date == null ||
                              details == null) {
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
                            await workExperience.addWorkExperience(
                              WorkExperience(role!, company!, true, false,
                                  start_date!, end_date!, details!, current),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Add'),
                      ),
                      SizedBox(
                        width: 200.0,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0XFFF22C2C)),
                          ),
                          onPressed: () {
                            print(current);
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'))
                    ],
                  ),
                  if (workExperience.status == Status.LOADING)
                    CircularProgressIndicator(),
                  if (workExperience.status == Status.ERROR)
                    Text('Bad connetion'),
                ],
              ),
            ),
          ),
        ));
  }
}
