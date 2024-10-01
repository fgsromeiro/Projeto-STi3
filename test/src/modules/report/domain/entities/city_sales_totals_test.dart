import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/city_sales_totals.dart';

class MockCitySalesTotals extends Mock implements CitySalesTotals {}

void main() {
  late final MockCitySalesTotals mockCitySalesTotals;

  setUpAll(
    () {
      mockCitySalesTotals = MockCitySalesTotals();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockCitySalesTotals);
    },
  );

  test('should create a CitySalesTotals instance with the correct values', () {
    const cityData = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(cityData.city, equals('city-test'));
    expect(cityData.quantityOrders, equals(0));
    expect(cityData.totalValue, equals(0));
  });

  test('should compare two different CitySalesTotals objects and return false',
      () {
    const cityData1 = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const cityData2 = CitySalesTotals(
      city: 'city',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(cityData1 == cityData2, isFalse);
  });

  test('Should compare two identical CitySalesTotals objects and return true',
      () {
    const cityData1 = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const cityData2 = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(cityData1 == cityData2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const cityData1 = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    const cityData2 = CitySalesTotals(
      city: 'city-test',
      quantityOrders: 0,
      totalValue: 0,
    );

    expect(cityData1.hashCode, equals(cityData2.hashCode));
  });
}
