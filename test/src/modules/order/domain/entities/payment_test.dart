import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';

class MockPayment extends Mock implements Payment {}

void main() {
  late final MockPayment mockPayment;

  setUpAll(
    () {
      mockPayment = MockPayment();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockPayment);
    },
  );

  test('should create a Payment instance with the correct values', () {
    const payment = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    expect(payment.id, equals('1'));
    expect(payment.code, equals('code-test'));
    expect(payment.installmentQuantity, equals(0));
    expect(payment.title, equals('title-test'));
    expect(payment.value, equals(0));
  });

  test('should compare two different Payment objects and return false', () {
    const payment1 = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    const payment2 = Payment(
      id: '2',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    expect(payment1 == payment2, isFalse);
  });

  test('Should compare two identical Payment objects and return true', () {
    const payment1 = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    const payment2 = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    expect(payment1 == payment2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const payment1 = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    const payment2 = Payment(
      id: '1',
      code: 'code-test',
      installmentQuantity: 0,
      title: 'title-test',
      value: 0,
    );

    expect(payment1.hashCode, equals(payment2.hashCode));
  });
}
