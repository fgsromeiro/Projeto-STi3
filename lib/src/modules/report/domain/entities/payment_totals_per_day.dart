// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PaymentTotalsPerDay extends Equatable {
  final String orderDate;
  final String paymentMethod;
  final double value;

  const PaymentTotalsPerDay({
    required this.orderDate,
    required this.paymentMethod,
    required this.value,
  });

  @override
  List<Object> get props => [
        orderDate,
        paymentMethod,
        value,
      ];
}
