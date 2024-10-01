import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/payment_totals_per_day.dart';

class MockPaymentTotalsPerDay extends Mock implements PaymentTotalsPerDay {}

class MockColor extends Mock implements Color {}

void main() {
  late final MockPaymentTotalsPerDay mockPaymentTotalsPerDay;

  setUpAll(
    () {
      mockPaymentTotalsPerDay = MockPaymentTotalsPerDay();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockPaymentTotalsPerDay);
    },
  );

  test('should create a PaymentTotalsPerDay instance with the correct values',
      () {
    const paymentData = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    expect(paymentData.orderDate, equals('orderDate-test'));
    expect(paymentData.value, equals(0));
    expect(paymentData.paymentMethod, equals('paymentMethod-test'));
  });

  test(
      'should compare two different PaymentTotalsPerDay objects and return false',
      () {
    const paymentData1 = PaymentTotalsPerDay(
        orderDate: 'orderDate', paymentMethod: 'paymentMethod', value: 0);

    const paymentData2 = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    expect(paymentData1 == paymentData2, isFalse);
  });

  test(
      'Should compare two identical PaymentTotalsPerDay objects and return true',
      () {
    const paymentData1 = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    const paymentData2 = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    expect(paymentData1 == paymentData2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const paymentData1 = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    const paymentData2 = PaymentTotalsPerDay(
        orderDate: 'orderDate-test',
        paymentMethod: 'paymentMethod-test',
        value: 0);

    expect(paymentData1.hashCode, equals(paymentData2.hashCode));
  });
}
