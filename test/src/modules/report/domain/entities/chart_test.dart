import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';

class MockChart extends Mock implements Chart {}

class MockColor extends Mock implements Color {}

void main() {
  late final MockChart mockChart;
  late final MockColor mockColor;
  late final ChartData chartData;

  setUpAll(
    () {
      mockChart = MockChart();
      mockColor = MockColor();
      chartData = ChartData(
        productName: 'productName-test',
        value: 0,
        valueReal: 0,
        color: mockColor,
      );
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockChart);
      clearInteractions(mockColor);
    },
  );

  test('should create a Chart instance with the correct values', () {
    final chart = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    expect(chart.title, equals('title-test'));
    expect(chart.subTitle, equals('subTitle-test'));
    expect(chart.chartDatas, equals([chartData]));
  });

  test('should compare two different Chart objects and return false', () {
    final chart1 = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    final chart2 = Chart(
      title: 'title',
      subTitle: 'subTitle',
      chartDatas: [chartData],
    );

    expect(chart1 == chart2, isFalse);
  });

  test('Should compare two identical Chart objects and return true', () {
    final chart1 = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    final chart2 = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    expect(chart1 == chart2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    final chart1 = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    final chart2 = Chart(
      title: 'title-test',
      subTitle: 'subTitle-test',
      chartDatas: [chartData],
    );

    expect(chart1.hashCode, equals(chart2.hashCode));
  });
}
