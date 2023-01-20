import 'package:cvmaker/model/workExperience.dart';
import 'package:cvmaker/viewmodel/workExperienceViewModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditWorkExperience extends StatefulWidget {
  WorkExperience? workExperience;


  EditWorkExperience(this.workExperience, {Key? key}) : super(key: key);

  @override
  State<EditWorkExperience> createState() => _EditWorkExperienceState();
}

class _EditWorkExperienceState extends State<EditWorkExperience> {
  TextEditingController dateInputStartDate = TextEditingController();
  TextEditingController dateInputEndDate = TextEditingController();


  String? name;
  String? brief;
  String? role;
  String? startDate;
  String? endDate;

  void onChanged(bool? vvv) {
    setState(() {
      widget.workExperience?.current = vvv!;
    });
  }


  @override
  void initState() {
    dateInputStartDate.text = widget.workExperience!.start_date.toString();
    dateInputEndDate.text = widget.workExperience!.end_date.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var work = context.watch<WorkExperienceViewModel>();

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
                    widget.workExperience?.role= value;
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
                height: 50,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.workExperience?.company = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Company',
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
                  controller: dateInputStartDate,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        dateInputStartDate.text = formattedDate;
                        widget.workExperience?.start_date =
                            formattedDate;
                        //set output date to TextField value.
                      });
                    } else {}
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Date*',
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
              Row(children: [
                const SizedBox(
                  width: 10.0,
                ),
                Checkbox(
                  value: widget.workExperience?.current,
                  onChanged: onChanged,
                  fillColor: MaterialStateProperty.all(Colors.green),
                ),
                const Text('This is my current job')
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
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        dateInputEndDate.text = formattedDate;
                        widget.workExperience?.end_date =
                          formattedDate;
                        //set output date to TextField value.
                      });
                    } else {}
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: 'Date*',
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
                    widget.workExperience?.details = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Details',
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
                        await work.editInfo(widget.workExperience!);
                        Navigator.pop(context);
                      },
                      child: const Text('Save')),
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
