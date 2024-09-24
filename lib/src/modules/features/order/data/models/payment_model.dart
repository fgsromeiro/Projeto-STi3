import 'dart:convert';

import 'package:projeto_sti3/src/modules/features/order/domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel(
      {required super.id,
      required super.installmentQuantity,
      required super.value,
      required super.code,
      required super.title});

  factory PaymentModel.fromEntity(Payment entity) => PaymentModel(
        id: entity.id,
        installmentQuantity: entity.installmentQuantity,
        value: entity.value,
        code: entity.code,
        title: entity.title,
      );

  Payment toEntity() => Payment(
        id: id,
        installmentQuantity: installmentQuantity,
        value: value,
        code: code,
        title: title,
      );

  factory PaymentModel.fromMap(Map<String, Object?> map) => PaymentModel(
        id: map['id'] != null ? map['id'] as String : '',
        installmentQuantity: map['parcela'] != null ? map['parcela'] as int : 0,
        value: map['valor'] != null ? map['valor'] as double : 0.0,
        code: map['codigo'] != null ? map['codigo'] as String : '',
        title: map['nome'] != null ? map['nome'] as String : '',
      );

  factory PaymentModel.fromJson(String json) =>
      PaymentModel.fromMap(jsonDecode(json) as Map<String, Object?>);
}
