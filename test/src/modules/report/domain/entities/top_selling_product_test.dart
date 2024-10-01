import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/top_selling_product.dart';

class MockTopSellingProduct extends Mock implements TopSellingProduct {}

class MockColor extends Mock implements Color {}

void main() {
  late final MockTopSellingProduct mockTopSellingProduct;

  setUpAll(
    () {
      mockTopSellingProduct = MockTopSellingProduct();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockTopSellingProduct);
    },
  );

  test('should create a TopSellingProduct instance with the correct values',
      () {
    const topSellingData = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    expect(topSellingData.nameProduct, equals('nameProduct-test'));
    expect(topSellingData.totalValue, equals(0));
    expect(topSellingData.quantity, equals(0));
  });

  test(
      'should compare two different TopSellingProduct objects and return false',
      () {
    const topSelling1 = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    const topSelling2 = TopSellingProduct(
      nameProduct: 'nameProduct',
      quantity: 0,
      totalValue: 0,
    );

    expect(topSelling1 == topSelling2, isFalse);
  });

  test('Should compare two identical TopSellingProduct objects and return true',
      () {
    const topSelling1 = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    const topSelling2 = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    expect(topSelling1 == topSelling2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const topSelling1 = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    const topSelling2 = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 0,
      totalValue: 0,
    );

    expect(topSelling1.hashCode, equals(topSelling2.hashCode));
  });

  test('should return the average value correctly', () {
    const topSellingProduct = TopSellingProduct(
      nameProduct: 'nameProduct-test',
      quantity: 2,
      totalValue: 100,
    );

    final average = topSellingProduct.averageValue;

    expect(average, equals(50));
  });
}
