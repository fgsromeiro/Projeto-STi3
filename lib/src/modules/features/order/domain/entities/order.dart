// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/payment.dart';

part '../../../../../shared/hive/generator/order.g.dart';

@HiveType(typeId: 4)
class Order extends Equatable {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final int numberOrder;

  @HiveField(2)
  final String creationDate;

  @HiveField(3)
  final String modificationDate;

  @HiveField(4)
  final String status;

  @HiveField(5)
  final double discount;

  @HiveField(6)
  final double freight;

  @HiveField(7)
  final double subTotal;

  @HiveField(8)
  final double totalValue;

  @HiveField(9)
  final Client client;

  @HiveField(10)
  final Address deliveryAddress;

  @HiveField(11)
  final List<Item> itens;

  @HiveField(12)
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
