import 'dart:convert';

import 'package:cvmaker/const.dart';
import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/networkResopnse.dart';
import 'package:cvmaker/repository/contactInfoRepository.dart';

class ContactInfoRepositoryImpl extends ContactInfoRepository {
  @override
  Future<NetworkResponse> addInfo(ContactInfo contactInfo) async {
    final response = await client.post(
      Uri.parse('$baseUrl/contact'),
      body: jsonEncode(contactInfo.toMap()),
    );
    NetworkResponse result = NetworkResponse();
    print(response.statusCode);
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> deleteInfo(String id) async {
    final response = await client.delete(
      Uri.parse('$baseUrl/contact/$id'),
    );
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No Connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse> editInfo(ContactInfo contactInfo) async {
    final response = await client.put(
        Uri.parse('$baseUrl/contact/${contactInfo.id}'),
        body: jsonEncode(contactInfo.toMap()));
    print(response.statusCode);
    NetworkResponse result = NetworkResponse();
    if (response.statusCode == 200) {
      result.success = true;
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }

  @override
  Future<NetworkResponse<List<ContactInfo>>> getInfo() async {
    final response = await client.get(Uri.parse('$baseUrl/contact'));
    NetworkResponse<List<ContactInfo>> result = NetworkResponse();
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      result.success = true;
      result.data = data.map((e) => ContactInfo.fromMap(e)).toList();
      return result;
    } else {
      result.success = false;
      result.error = 'No connection';
      return result;
    }
  }
}
