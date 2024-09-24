import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String idProduct;
  final String title;
  final int quantity;
  final double unitValue;

  const Item({
    required this.id,
    required this.idProduct,
    required this.title,
    required this.quantity,
    required this.unitValue,
  });

  @override
  List<Object> get props {
    return [
      id,
      idProduct,
      title,
      quantity,
      unitValue,
    ];
  }
}
