class CoursesAndProjects {
  String name;
  String date;
  String description;

  CoursesAndProjects(this.name, this.date, this.description);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'description': description,
    };
  }

  factory CoursesAndProjects.fromMap(Map<String, dynamic> map) {
    return CoursesAndProjects(map['name'], map['date'], map['description']);
  }
}
