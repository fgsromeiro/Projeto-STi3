// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TopSellingProduct extends Equatable {
  final String nameProduct;
  final int quantity;
  final double averageValue;
  
  const TopSellingProduct({
    required this.nameProduct,
    required this.quantity,
    required this.averageValue,
  });

  @override
  List<Object?> get props => [
        nameProduct,
        quantity,
        averageValue,
      ];
}
