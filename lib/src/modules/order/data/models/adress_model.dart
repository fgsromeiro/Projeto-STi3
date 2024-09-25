import 'dart:convert';

import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';

class AdressModel extends Address {
  const AdressModel({
    required super.id,
    required super.street,
    required super.number,
    required super.postCode,
    required super.district,
    required super.city,
    required super.state,
    required super.complement,
    required super.reference,
  });

  factory AdressModel.fromEntity(Address entity) => AdressModel(
        id: entity.id,
        street: entity.street,
        number: entity.number,
        postCode: entity.postCode,
        district: entity.district,
        city: entity.city,
        state: entity.state,
        complement: entity.complement,
        reference: entity.reference,
      );

  Address toEntity() => Address(
        id: id,
        street: street,
        number: number,
        postCode: postCode,
        district: district,
        city: city,
        state: state,
        complement: complement,
        reference: reference,
      );

  factory AdressModel.fromMap(Map<String, Object?> map) {
    return AdressModel(
      id: map['id'] != null ? map['id'] as String : '',
      street: map['endereco'] != null ? map['endereco'] as String : '',
      number: map['numero'] != null ? map['numero'] as String : '',
      postCode: map['cep'] != null ? map['cep'] as String : '',
      district: map['bairro'] != null ? map['bairro'] as String : '',
      city: map['cidade'] != null ? map['cidade'] as String : '',
      state: map['estado'] != null ? map['estado'] as String : '',
      complement:
          map['complemento'] != null ? map['complemento'] as String : '',
      reference: map['referencia'] != null ? map['referencia'] as String : '',
    );
  }

  factory AdressModel.fromJson(String json) =>
      AdressModel.fromMap(jsonDecode(json) as Map<String, Object?>);
}
