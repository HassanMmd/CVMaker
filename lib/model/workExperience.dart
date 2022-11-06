import 'package:flutter/rendering.dart';

class WorkExperience {
  String? id;
  String role;
  String company;
  bool? freelance;
  bool? remote;
  String start_date;
  String end_date;
  String? details;
  bool current;

  WorkExperience( this.role, this.company, this.freelance, this.remote,
      this.start_date, this.end_date, this.details, this.current,{this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'company': company,
      'freelance': freelance,
      'remote': remote,
      'start_date': start_date,
      'end_date': end_date,
      'details': details,
      'current': current,
    };
  }

  factory WorkExperience.fromMap(Map<String, dynamic> map) {
    return WorkExperience(
      map['role'],
      map['company'],
      map['freelance'],
      map['remote'],
      map['start_date'],
      map['end_date'],
      map['details'],
      map['current'],
      id: map['id'],
    );
  }
}
