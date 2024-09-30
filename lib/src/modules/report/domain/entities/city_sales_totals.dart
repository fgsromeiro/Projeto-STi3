// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CitySalesTotals extends Equatable {
  final String city;
  final int quantityOrders;
  final double totalValue;

  const CitySalesTotals({
    required this.city,
    required this.quantityOrders,
    required this.totalValue,
  });

  @override
  List<Object> get props => [
        city,
        quantityOrders,
        totalValue,
      ];
}
