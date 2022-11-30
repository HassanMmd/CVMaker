import 'package:cvmaker/model/contactInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactInfo_Info extends StatelessWidget {
  ContactInfo contactInfo;

  ContactInfo_Info(this.contactInfo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Card(
            color: Color(0XFFF0F0F0),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          contactInfo.type,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          contactInfo.data,
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
