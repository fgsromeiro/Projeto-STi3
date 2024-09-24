import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String id;
  final String street;
  final String number;
  final String postCode;
  final String district;
  final String city;
  final String state;
  final String complement;
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
