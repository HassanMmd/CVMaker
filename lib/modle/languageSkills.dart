class LanguageSkills {
  String language;
  String level;

  LanguageSkills(this.language, this.level);

  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'level': level,
    };
  }

  factory LanguageSkills.fromMap(Map<String, dynamic> map) {
    return LanguageSkills(map['language'], map['level']);
  }
}
