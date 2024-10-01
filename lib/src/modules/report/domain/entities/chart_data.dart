// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:equatable/equatable.dart';

class ChartData extends Equatable {
  final String productName;
  final int value;
  final double valueReal;
  final Color color;

  const ChartData({
    required this.productName,
    required this.value,
    required this.valueReal,
    required this.color,
  });

  @override
  List<Object> get props => [productName, value, valueReal, color];
}
