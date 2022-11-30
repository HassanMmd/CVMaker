class LanguageSkills {
  String? id;
  String name;
  int level;

  LanguageSkills(this.name, this.level, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'level': level,
    };
  }

  factory LanguageSkills.fromMap(Map<String, dynamic> map) {
    return LanguageSkills(
      map['name'],
      map['level'],
      id: map['id'],
    );
  }
}
