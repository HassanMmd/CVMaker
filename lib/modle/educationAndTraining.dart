class EducationAndTraining {
  String field;
  String schoolOrUniversity;
  String place;
  String date;

  EducationAndTraining(
      this.field, this.schoolOrUniversity, this.place, this.date);

  Map<String, dynamic> toMap() {
    return {
      'field': field,
      'schoolOrUniversity': schoolOrUniversity,
      'place': place,
      'date': date,
    };
  }

  factory EducationAndTraining.fromMap(Map<String, dynamic> map) {
    return EducationAndTraining(
        map['field'], map['schoolOrUniversity'], map['place'], map['date']);
  }
}
