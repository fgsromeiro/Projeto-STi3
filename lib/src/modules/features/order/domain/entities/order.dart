// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/payment.dart';

class Order extends Equatable {
  final String id;
  final int numberOrder;
  final String creationDate;
  final String modificationDate;
  final String status;
  final double discount;
  final double freight;
  final double subTotal;
  final double totalValue;
  final Client client;
  final Address deliveryAddress;
  final List<Item> itens;
  final List<Payment> payments;
  const Order({
    required this.id,
    required this.numberOrder,
    required this.creationDate,
    required this.modificationDate,
    required this.status,
    required this.discount,
    required this.freight,
    required this.subTotal,
    required this.totalValue,
    required this.client,
    required this.deliveryAddress,
    required this.itens,
    required this.payments,
  });

  @override
  List<Object> get props {
    return [
      id,
      numberOrder,
      creationDate,
      modificationDate,
      status,
      discount,
      freight,
      subTotal,
      totalValue,
      client,
      deliveryAddress,
      itens,
      payments,
    ];
  }
}
