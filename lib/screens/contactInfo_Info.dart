import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/screens/editContactInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/contactInfoViewModel.dart';

class ContactInfo_Info extends StatelessWidget {
  ContactInfo contactInfo;

  ContactInfo_Info(this.contactInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contactViewModel = context.watch<ContactInfoViewModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Card(
            color: const Color(0XFFF0F0F0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Text(
                            contactInfo.type,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      contactInfo.data,
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditContactInfo(contactInfo)));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0XFF568ABB)),
                        ),
                        child: const Text('Edit'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          contactViewModel.deleteInfo(contactInfo.id!);
                          contactViewModel.getContactInfo();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0XFFF22C2C)),
                        ),
                        child: const Text('delete'),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
