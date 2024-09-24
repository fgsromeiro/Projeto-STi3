import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String id;
  final int installmentQuantity;
  final double value;
  final String code;
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
