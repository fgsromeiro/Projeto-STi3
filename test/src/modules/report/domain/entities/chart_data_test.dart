import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';

class MockChartData extends Mock implements ChartData {}

class MockColor extends Mock implements Color {}

void main() {
  late final MockChartData mockChartData;
  late final MockColor mockColor;

  setUpAll(
    () {
      mockChartData = MockChartData();
      mockColor = MockColor();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockChartData);
      clearInteractions(mockColor);
    },
  );

  test('should create a ChartData instance with the correct values', () {
    final chartData = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    expect(chartData.productName, equals('productName-test'));
    expect(chartData.value, equals(0));
    expect(chartData.valueReal, equals(0));
    expect(chartData.color, equals(mockColor));
  });

  test('should compare two different Customer objects and return false', () {
    final chart1 = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    final chart2 = ChartData(
      productName: 'productName',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    expect(chart1 == chart2, isFalse);
  });

  test('Should compare two identical ChartData objects and return true', () {
    final chart1 = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    final chart2 = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    expect(chart1 == chart2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    final chart1 = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    final chart2 = ChartData(
      productName: 'productName-test',
      value: 0,
      valueReal: 0,
      color: mockColor,
    );

    expect(chart1.hashCode, equals(chart2.hashCode));
  });
}
