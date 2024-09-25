// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../modules/order/domain/entities/order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 4;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as String,
      numberOrder: fields[1] as int,
      creationDate: fields[2] as String,
      modificationDate: fields[3] as String,
      status: fields[4] as String,
      discount: fields[5] as double,
      freight: fields[6] as double,
      subTotal: fields[7] as double,
      totalValue: fields[8] as double,
      client: fields[9] as Client,
      deliveryAddress: fields[10] as Address,
      itens: (fields[11] as List).cast<Item>(),
      payments: (fields[12] as List).cast<Payment>(),
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.numberOrder)
      ..writeByte(2)
      ..write(obj.creationDate)
      ..writeByte(3)
      ..write(obj.modificationDate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.freight)
      ..writeByte(7)
      ..write(obj.subTotal)
      ..writeByte(8)
      ..write(obj.totalValue)
      ..writeByte(9)
      ..write(obj.client)
      ..writeByte(10)
      ..write(obj.deliveryAddress)
      ..writeByte(11)
      ..write(obj.itens)
      ..writeByte(12)
      ..write(obj.payments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
