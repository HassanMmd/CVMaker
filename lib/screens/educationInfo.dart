import 'package:cvmaker/model/educationAndTraining.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationInfo extends StatelessWidget {
  EducationAndTraining educationAndTraining;

  EducationInfo(this.educationAndTraining);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Card(
          color: Color(0XFFF0F0F0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        educationAndTraining.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '${educationAndTraining.start_date}-${educationAndTraining.end_date}',
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  educationAndTraining.school,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    educationAndTraining.country!,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFF568ABB)),
                      ),
                      child: Text('Edit'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0XFFF22C2C)),
                      ),
                      child: Text('delete'),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
