class EducationAndTraining {
  String? id;
  String name;
  String school;
  String? country;
  String? start_date;
  String? end_date;

  EducationAndTraining(
      this.name, this.school, this.country, this.start_date, this.end_date,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'school': school,
      'country': country,
      'start_date': start_date,
      'end_date': end_date,
    };
  }

  factory EducationAndTraining.fromMap(Map<String, dynamic> map) {
    return EducationAndTraining(map['name'], map['school'], map['country'],
        map['start_date'], map['end_date'],
        id: map['id']);
  }
}
