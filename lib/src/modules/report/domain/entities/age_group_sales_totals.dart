// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AgeGroupSalesTotals extends Equatable {
  final String ageRange;
  final int quantityOrders;
  final double totalValue;

  const AgeGroupSalesTotals({
    required this.ageRange,
    required this.quantityOrders,
    required this.totalValue,
  });

  @override
  List<Object?> get props => [
        ageRange,
        quantityOrders,
        totalValue,
      ];
}
