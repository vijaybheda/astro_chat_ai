import 'package:astro_chat_ai/enumerations.dart';
import 'package:flutter/material.dart';

class UserData {
  String? name;
  String? placeOfBirth;
  DateTime? dob;
  TimeOfDay? timeOfBirth;
  String? phoneNo;
  UserGender? gender;
  String? birthplaceLat;
  String? birthplaceLong;

  UserData({
    this.name,
    this.placeOfBirth,
    this.dob,
    this.timeOfBirth,
    this.phoneNo,
    this.gender,
    this.birthplaceLat,
    this.birthplaceLong,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    placeOfBirth = json['placeOfBirth'];
    dob = json['dob'];
    timeOfBirth = json['timeOfBirth'];
    phoneNo = json['phoneNo'];
    gender = json['gender'];
    birthplaceLat = json['birthplaceLat'];
    birthplaceLong = json['birthplaceLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['placeOfBirth'] = placeOfBirth;
    data['dob'] = dob;
    data['timeOfBirth'] = timeOfBirth;
    data['phoneNo'] = phoneNo;
    data['gender'] = gender;
    data['birthplaceLat'] = birthplaceLat;
    data['birthplaceLong'] = birthplaceLong;
    return data;
  }

  UserData? copyWith({
    String? name,
    String? placeOfBirth,
    DateTime? dob,
    TimeOfDay? timeOfBirth,
    String? phoneNo,
    UserGender? gender,
    String? birthplaceLat,
    String? birthplaceLong,
  }) {
    return UserData(
      name: name ?? this.name,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      dob: dob ?? this.dob,
      timeOfBirth: timeOfBirth ?? this.timeOfBirth,
      phoneNo: phoneNo ?? this.phoneNo,
      gender: gender ?? this.gender,
      birthplaceLat: birthplaceLat ?? this.birthplaceLat,
      birthplaceLong: birthplaceLong ?? this.birthplaceLong,
    );
  }
}
