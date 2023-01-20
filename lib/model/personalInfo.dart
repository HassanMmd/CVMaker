class PersonalInfo {
  String name;
  String role;

  String brief;

  String? id;

  PersonalInfo(this.name, this.role, this.brief, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'brief': brief,
      'id': id,
    };
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(map['name'], map['role'], map['brief'],id: map['id']);
  }
}
