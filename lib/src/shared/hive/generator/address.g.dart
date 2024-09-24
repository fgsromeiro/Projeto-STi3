// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../modules/features/order/domain/entities/address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 1;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      id: fields[0] as String,
      street: fields[1] as String,
      number: fields[2] as String,
      postCode: fields[3] as String,
      district: fields[4] as String,
      city: fields[5] as String,
      state: fields[6] as String,
      complement: fields[7] as String,
      reference: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.postCode)
      ..writeByte(4)
      ..write(obj.district)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.state)
      ..writeByte(7)
      ..write(obj.complement)
      ..writeByte(8)
      ..write(obj.reference);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
