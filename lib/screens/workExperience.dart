import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({Key? key}) : super(key: key);

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experience'),
        centerTitle: true,
      ),
      body: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Column(
              children: [
              Text(
              'اسم المنطقة',
            ),
            SizedBox(
              width: 200.0,
              height: 25.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ]),
      ),
    ),);
  }
}
