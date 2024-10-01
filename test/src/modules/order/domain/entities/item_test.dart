import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';

class MockItem extends Mock implements Item {}

void main() {
  late final MockItem mockItem;

  setUpAll(
    () {
      mockItem = MockItem();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockItem);
    },
  );

  test('should create a Item instance with the correct values', () {
    const item = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    expect(item.id, equals('id'));
    expect(item.idProduct, equals('idProduct-test'));
    expect(item.title, equals('title-test'));
    expect(item.quantity, equals(0));
    expect(item.unitValue, equals(0));
  });

  test('should compare two different Item objects and return false', () {
    const item1 = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    const item2 = Item(
      id: 'id',
      idProduct: 'idProduct',
      title: 'title',
      quantity: 0,
      unitValue: 0,
    );

    expect(item1 == item2, isFalse);
  });

  test('Should compare two identical Client objects and return true', () {
    const item1 = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    const item2 = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    expect(item1 == item2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const item1 = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    const item2 = Item(
      id: 'id',
      idProduct: 'idProduct-test',
      title: 'title-test',
      quantity: 0,
      unitValue: 0,
    );

    expect(item1.hashCode, equals(item2.hashCode));
  });
}
