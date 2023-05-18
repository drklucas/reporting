import 'dart:convert';

class AuthModel {
  String acess_token; 
  String token_type; 
  int expires_in; 

  AuthModel({
    required this.acess_token,
    required this.token_type,
    required this.expires_in,
  });
  


  Map<String, dynamic> toMap() {
    return {
      'acess_token': acess_token,
      'token_type': token_type,
      'expires_in': expires_in,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      acess_token: map['acess_token'] ?? '',
      token_type: map['token_type'] ?? '',
      expires_in: map['expires_in']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source));
}
