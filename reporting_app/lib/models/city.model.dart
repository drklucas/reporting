// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CityModel {
  int id;
  int codigo_municipio;
  int codigo_uf;
  String nome;
  CityModel({
    required this.id,
    required this.codigo_municipio,
    required this.codigo_uf,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo_municipio': codigo_municipio,
      'codigo_uf': codigo_uf,
      'nome': nome,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      codigo_municipio: map['codigo_municipio']?.toInt() ?? 0,
      codigo_uf: map['codigo_uf']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source));
}
