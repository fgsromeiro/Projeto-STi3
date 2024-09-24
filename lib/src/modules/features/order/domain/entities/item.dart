import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part '../../../../../shared/hive/generator/item.g.dart';

@HiveType(typeId: 3)
class Item extends Equatable {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String idProduct;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final int quantity;

  @HiveField(4)
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
