import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part '../../../../../shared/hive/generator/address.g.dart';

@HiveType(typeId: 1)
class Address extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String street;

  @HiveField(2)
  final String number;

  @HiveField(3)
  final String postCode;

  @HiveField(4)
  final String district;

  @HiveField(5)
  final String city;

  @HiveField(6)
  final String state;

  @HiveField(7)
  final String complement;

  @HiveField(8)
  final String reference;

  const Address({
    required this.id,
    required this.street,
    required this.number,
    required this.postCode,
    required this.district,
    required this.city,
    required this.state,
    required this.complement,
    required this.reference,
  });

  @override
  List<Object> get props {
    return [
      id,
      street,
      number,
      postCode,
      district,
      city,
      state,
      complement,
      reference,
    ];
  }
}
