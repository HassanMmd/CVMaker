import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../networkResopnse.dart';
import '../viewmodel/educationAndTrainingViewModel.dart';

class AddEducation extends StatefulWidget {
  const AddEducation({Key? key}) : super(key: key);

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  TextEditingController dateInputStartDate = TextEditingController();
  TextEditingController dateInputEndDate = TextEditingController();

  @override
  void initState() {
    dateInputStartDate.text = '';
    dateInputEndDate.text = '';
    super.initState();
  }

  String? name;
  String? school;
  String? start_date;
  String? end_date;
  String? country;

  NetworkResponse networkResponse = NetworkResponse();

  @override
  Widget build(BuildContext context) {
    var education = context.watch<EducationAndTrainingViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Education',
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
                        name = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
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
                        school = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'School',
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
                    height: 50,
                    width: 350,
                    child: TextField(
                      textAlign: TextAlign.left,
                      textAlignVertical: TextAlignVertical.top,
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        country = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Country',
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
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: 30.0,
                        // ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0XFF568ABB)),
                            ),
                            onPressed: () async {
                              await education.addEducationAndTraining(
                                  EducationAndTraining(name!, school!,
                                      country, start_date, end_date));
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0XFFF22C2C)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                        )
                      ],
                    ),
                  ),
                  if (education.status == Status.LOADING)
                    CircularProgressIndicator(),
                  if (education.status == Status.ERROR) Text('Bad connetion'),
                ],
              ),
            ),
          ),
        ));
  }
}
