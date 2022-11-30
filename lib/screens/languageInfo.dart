import 'package:cvmaker/model/languageSkills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LanguageInfo extends StatelessWidget {
  LanguageSkills language;

  LanguageInfo(this.language);



  @override
  Widget build(BuildContext context) {
    String level;


    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Card(

            color: Color(0XFFF0F0F0),
            child: Padding(
                padding: EdgeInsets.only(left: 10.0,top: 10.0),
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
                            language.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          if(language.level==1)
                          Text(
                            'Beginner',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                          if(language.level==2)
                            Text(
                              'Intermediate',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          if(language.level==3)
                            Text(
                              'Advanced',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          if(language.level==4)
                            Text(
                              'Fluent',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                        ],
                      ),
                    )


                  ],
                ),),
          ),
        ),
      ],
    );
  }
}
