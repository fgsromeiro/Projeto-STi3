import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';

class MockAddress extends Mock implements Address {}

void main() {
  late final MockAddress mockAddress;

  setUpAll(
    () {
      mockAddress = MockAddress();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockAddress);
    },
  );

  test('should create a Address instance with the correct values', () {
    const address = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    expect(address.id, equals('id'));
    expect(address.street, equals('street-test'));
    expect(address.number, equals('number-test'));
    expect(address.postCode, equals('postCode-test'));
    expect(address.district, equals('district-test'));
    expect(address.city, equals('city-test'));
    expect(address.state, equals('state-test'));
    expect(address.complement, equals('complement-test'));
    expect(address.reference, equals('reference-test'));
  });

  test('should compare two different Adsress objects and return false', () {
    const address1 = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    const address2 = Address(
      id: 'id',
      street: 'street',
      number: 'number',
      postCode: 'postCode',
      district: 'district',
      city: 'city',
      state: 'state',
      complement: 'complement',
      reference: 'reference',
    );

    expect(address1 == address2, isFalse);
  });

  test('Should compare two identical Address objects and return true', () {
    const address1 = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    const address2 = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    expect(address1 == address2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const address1 = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    const address2 = Address(
      id: 'id',
      street: 'street-test',
      number: 'number-test',
      postCode: 'postCode-test',
      district: 'district-test',
      city: 'city-test',
      state: 'state-test',
      complement: 'complement-test',
      reference: 'reference-test',
    );

    expect(address1.hashCode, equals(address2.hashCode));
  });
}
