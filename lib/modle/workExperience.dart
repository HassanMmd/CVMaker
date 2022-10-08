class WorkExperience {
  String from;
  String to;
  String field;
  String place;
  String companyName;

  WorkExperience(this.from, this.to, this.field, this.place, this.companyName);

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'field': field,
      'place': place,
      'companyName': companyName,
    };
  }

  factory WorkExperience.fromMap(Map<String, dynamic> map) {
    return WorkExperience(
        map['from'], map['to'], map['field'], map['place'], map['companyName']);
  }
}
