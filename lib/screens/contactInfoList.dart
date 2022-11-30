import 'package:cvmaker/screens/addContactInfo.dart';
import 'package:cvmaker/screens/contactInfo_Info.dart';
import 'package:cvmaker/viewmodel/contactInfoViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfoList extends StatefulWidget {
  const ContactInfoList({Key? key}) : super(key: key);

  @override
  State<ContactInfoList> createState() => _ContactInfoListState();
}

class _ContactInfoListState extends State<ContactInfoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AspectRatio(
            aspectRatio: 2 / 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0XFF56BB6C)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddContactInfo()));
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
        title: Text('Languages'),
      ),
      body: ListView(children: [
        Consumer<ContactInfoViewModel>(
          builder: (context, x, child) {
            return Column(
              children: [
                if (x.status == Status.LOADING) CircularProgressIndicator(),
                if (x.status == Status.ERROR) Text('Error loading'),
                Column(
                  children: x.contactInfo
                      .map(
                        (e) => ContactInfo_Info(e),
                  )
                      .toList(),
                ),
                SizedBox(
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
