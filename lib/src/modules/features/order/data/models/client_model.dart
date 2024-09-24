import 'dart:convert';

import 'package:projeto_sti3/src/modules/features/order/domain/entities/client.dart';

class ClientModel extends Client {
  const ClientModel({
    required super.id,
    required super.cnpj,
    required super.cpf,
    required super.name,
    required super.companyName,
    required super.email,
    required super.dateBirth,
  });

  factory ClientModel.fromEntity(Client entity) => ClientModel(
        id: entity.id,
        cnpj: entity.cnpj,
        cpf: entity.cpf,
        name: entity.name,
        companyName: entity.companyName,
        email: entity.email,
        dateBirth: entity.dateBirth,
      );

  Client toEntity() => Client(
        id: id,
        cnpj: cnpj,
        cpf: cpf,
        name: name,
        companyName: companyName,
        email: email,
        dateBirth: dateBirth,
      );

  factory ClientModel.fromMap(Map<String, Object?> map) => ClientModel(
      id: map['id'] != null ? map['id'] as String : '',
      cnpj: map['cnpj'] != null ? map['cnpj'] as String : '',
      cpf: map['cpf'] != null ? map['cpf'] as String : '',
      name: map['nome'] != null ? map['nome'] as String : '',
      companyName:
          map['razaoSocial'] != null ? map['razaoSocial'] as String : '',
      email: map['email'] != null ? map['email'] as String : '',
      dateBirth:
          map['dataNascimento'] != null ? map['dataNascimento'] as String : '');

  factory ClientModel.fromJson(String json) =>
      ClientModel.fromMap(jsonDecode(json) as Map<String, Object?>);
}
