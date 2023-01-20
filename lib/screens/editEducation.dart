import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../viewmodel/educationAndTrainingViewModel.dart';

class EditEducation extends StatefulWidget {
  EducationAndTraining? educationAndTraining;

  EditEducation(this.educationAndTraining, {Key? key}) : super(key: key);

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
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

  @override
  Widget build(BuildContext context) {
    var education = context.watch<EducationAndTrainingViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Education',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        widget.educationAndTraining?.name = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name*',
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
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: TextField(
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        widget.educationAndTraining?.school = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'School*',
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
                  const SizedBox(
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
                            widget.educationAndTraining?.start_date =
                                dateInputStartDate.text;
                            //set output date to TextField value.
                          });
                        } else {}
                      },
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        widget.educationAndTraining?.start_date = value;
                      },
                      decoration: const InputDecoration(
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
                  const SizedBox(
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
                            widget.educationAndTraining?.end_date =
                                dateInputEndDate.text;
                            //set output date to TextField value.
                          });
                        } else {}
                      },
                      // textAlign: TextAlign.center,
                      onChanged: (value) {
                        widget.educationAndTraining?.end_date = value;
                      },
                      decoration: const InputDecoration(
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
                  const SizedBox(
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
                        widget.educationAndTraining?.country = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Country*',
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
                    padding: const EdgeInsets.all(20.0),
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
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0XFF568ABB)),
                            ),
                            onPressed: () async {
                              // if (name == null ||
                              //     school == null ||
                              //     start_date == null ||
                              //     end_date == null ||
                              //     country == null) {
                              //   showModalBottomSheet(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return SizedBox(
                              //           height: 200.0,
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               const Text(
                              //                 'Please fill all the fields',
                              //                 style: TextStyle(
                              //                     fontSize: 20.0,
                              //                     fontWeight: FontWeight.bold),
                              //               ),
                              //               const SizedBox(height: 25.0),
                              //               ElevatedButton(
                              //                   onPressed: () {
                              //                     Navigator.pop(context);
                              //                   },
                              //                   child: const Text('Ok'))
                              //             ],
                              //           ),
                              //         );
                              //       });
                              // } else {
                                await education.editInfo(widget.educationAndTraining!);
                                Navigator.pop(context);
                              // }
                            },
                            child: const Text('Save'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0XFFF22C2C)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                        )
                      ],
                    ),
                  ),
                  if (education.status == Status.LOADING)
                    const CircularProgressIndicator(),
                  if (education.status == Status.ERROR) const Text('Bad connetion'),
                ],
              ),
            ),
          ),
        ));
  }
}
