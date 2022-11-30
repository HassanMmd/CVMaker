class ContactInfo {
  String? id;
  String data;
  String type;

  ContactInfo(this.data, this.type, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data,
      'type': type,
    };
  }

  factory ContactInfo.fromMap(Map<String, dynamic> map) {
    return ContactInfo(
      map['data'],
      map['type'],
      id: map['id'],
    );
  }
}
