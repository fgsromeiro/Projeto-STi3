import 'dart:convert';

import 'package:projeto_sti3/src/modules/features/order/data/models/adress_model.dart';
import 'package:projeto_sti3/src/modules/features/order/data/models/client_model.dart';
import 'package:projeto_sti3/src/modules/features/order/data/models/item_model.dart';
import 'package:projeto_sti3/src/modules/features/order/data/models/payment_model.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.numberOrder,
    required super.creationDate,
    required super.modificationDate,
    required super.status,
    required super.discount,
    required super.freight,
    required super.subTotal,
    required super.totalValue,
    required super.client,
    required super.deliveryAddress,
    required super.itens,
    required super.payments,
  });

  factory OrderModel.fromEntity(Order entity) => OrderModel(
        id: entity.id,
        numberOrder: entity.numberOrder,
        creationDate: entity.creationDate,
        modificationDate: entity.modificationDate,
        status: entity.status,
        discount: entity.discount,
        freight: entity.freight,
        subTotal: entity.subTotal,
        totalValue: entity.totalValue,
        client: entity.client,
        deliveryAddress: entity.deliveryAddress,
        itens: entity.itens,
        payments: entity.payments,
      );

  Order toEntity() => Order(
      id: id,
      numberOrder: numberOrder,
      creationDate: creationDate,
      modificationDate: modificationDate,
      status: status,
      discount: discount,
      freight: freight,
      subTotal: subTotal,
      totalValue: totalValue,
      client: client,
      deliveryAddress: deliveryAddress,
      itens: itens,
      payments: payments);

  factory OrderModel.fromMap(Map<String, Object?> map) {
    var listOfItem = <ItemModel>[];
    var listOfPayment = <PaymentModel>[];

    if (map['itens'] != null) {
      listOfItem = List<ItemModel>.of(
        (map['itens'] as List)
            .map(
              (item) => ItemModel.fromMap(map),
            )
            .toList(),
      );
    }

    if (map['pagamento'] != null) {
      listOfPayment = List<PaymentModel>.of(
        (map['pagamento'] as List)
            .map(
              (item) => PaymentModel.fromMap(map),
            )
            .toList(),
      );
    }

    return OrderModel(
      id: map['id'] != null ? map['id'] as String : '',
      numberOrder: map['numero'] != null ? map['numero'] as int : 0,
      creationDate:
          map['dataCriacao'] != null ? map['dataCriacao'] as String : '',
      modificationDate:
          map['dataAlteracao'] != null ? map['dataAlteracao'] as String : '',
      status: map['status'] != null ? map['status'] as String : '',
      discount: map['desconto'] is int
          ? (map['desconto'] as int).toDouble()
          : map['desconto'] as double,
      freight: map['frete'] is int
          ? (map['frete'] as int).toDouble()
          : map['frete'] as double,
      subTotal: map['subTotal'] != null ? map['subTotal'] as double : 0.0,
      totalValue: map['valorTotal'] != null ? map['valorTotal'] as double : 0.0,
      client: ClientModel.fromMap(map['cliente'] as Map<String, dynamic>),
      deliveryAddress:
          AdressModel.fromMap(map['enderecoEntrega'] as Map<String, dynamic>),
      itens: listOfItem,
      payments: listOfPayment,
    );
  }

  factory OrderModel.fromJson(String json) =>
      OrderModel.fromMap(jsonDecode(json) as Map<String, Object?>);
}
