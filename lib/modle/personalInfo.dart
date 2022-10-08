class PersonalInfo {
  String name;
  String dateOfBirth;
  String gender;
  String nationality;
  String email;
  int phoneNumber;
  String address;

  PersonalInfo(this.name, this.dateOfBirth, this.gender, this.nationality,
      this.email, this.phoneNumber, this.address);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'nationality': nationality,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(map['name'], map['dateOfBirth'], map['gender'],
        map['nationality'], map['email'], map['phoneNumber'], map['address']);
  }
}
