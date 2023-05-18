// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ProfileModel {
  int? id; 
  String first_name; 
  String last_name; 
  String? photo; 
  String? cover_photo; 
  String birth_date; 
  String? city; 
  int? user_id;  

  ProfileModel({
    this.id,
    required this.first_name,
    required this.last_name,
    this.photo,
    this.cover_photo,
    required this.birth_date,
    this.city,
    this.user_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'photo': photo,
      'cover_photo': cover_photo,
      'birth_date': birth_date,
      'city': city,
      'user_id': user_id,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id']?.toInt() ?? 0,
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      photo: map['photo'],
      cover_photo: map['cover_photo'],
      birth_date: map['birth_date'] ?? '',
      city: map['city'],
      user_id: map['user_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));
}
