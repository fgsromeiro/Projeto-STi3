import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/age_group_sales_totals.dart';

class MockAgeGroupSalesTotals extends Mock implements AgeGroupSalesTotals {}

void main() {
  late final MockAgeGroupSalesTotals mockChartData;

  setUpAll(
    () {
      mockChartData = MockAgeGroupSalesTotals();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockChartData);
    },
  );

  test('should create a AgeGroupSalesTotals instance with the correct values',
      () {
    const ageGroup = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(ageGroup.ageRange, equals('ageRange-test'));
    expect(ageGroup.quantityOrders, equals(0));
    expect(ageGroup.totalValue, equals(0));
  });

  test(
      'should compare two different AgeGroupSalesTotals objects and return false',
      () {
    const ageGroup1 = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const ageGroup2 = AgeGroupSalesTotals(
      ageRange: 'ageRange',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(ageGroup1 == ageGroup2, isFalse);
  });

  test(
      'Should compare two identical AgeGroupSalesTotals objects and return true',
      () {
    const ageGroup1 = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const ageGroup2 = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(ageGroup1 == ageGroup2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const ageGroup1 = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const ageGroup2 = AgeGroupSalesTotals(
      ageRange: 'ageRange-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(ageGroup1.hashCode, equals(ageGroup2.hashCode));
  });
}
