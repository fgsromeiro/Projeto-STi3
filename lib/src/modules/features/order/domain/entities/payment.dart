import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part '../../../../../shared/hive/generator/payment.g.dart';

@HiveType(typeId: 5)
class Payment extends Equatable {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final int installmentQuantity;

  @HiveField(2)
  final double value;

  @HiveField(3)
  final String code;

  @HiveField(4)
  final String title;

  const Payment({
    required this.id,
    required this.installmentQuantity,
    required this.value,
    required this.code,
    required this.title,
  });

  @override
  List<Object> get props {
    return [
      id,
      installmentQuantity,
      value,
      code,
      title,
    ];
  }
}
