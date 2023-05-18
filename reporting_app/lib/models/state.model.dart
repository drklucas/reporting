// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class StateModel {
  int codigo_uf; 
  String uf; 
  String nome;
   
  StateModel({
    required this.codigo_uf,
    required this.uf,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'codigo_uf': codigo_uf,
      'uf': uf,
      'nome': nome,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      codigo_uf: map['codigo_uf']?.toInt() ?? 0,
      uf: map['uf'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) => StateModel.fromMap(json.decode(source));
} 
