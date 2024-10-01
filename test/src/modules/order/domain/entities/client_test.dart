import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/client.dart';

class MockClient extends Mock implements Client {}

void main() {
  late final MockClient mockClient;

  setUpAll(
    () {
      mockClient = MockClient();
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockClient);
    },
  );

  test('should create a Client instance with the correct values', () {
    const client = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    expect(client.id, equals('1'));
    expect(client.cnpj, equals('00.000.000/0000-00'));
    expect(client.cpf, equals('000.000.000-00'));
    expect(client.name, equals('name-test'));
    expect(client.companyName, equals('companyName-test'));
    expect(client.email, equals('emial-test'));
    expect(client.dateBirth, equals('emial-test'));
  });

  test('should compare two different Client objects and return false', () {
    const client1 = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    const client2 = Client(
      id: '1',
      cnpj: '00.000.000/0000-01',
      cpf: '000.000.000-01',
      name: 'name',
      companyName: 'companyName',
      email: 'emial',
      dateBirth: 'emial',
    );

    expect(client1 == client2, isFalse);
  });

  test('Should compare two identical Client objects and return true', () {
    const client1 = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    const client2 = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    expect(client1 == client2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    const client1 = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    const client2 = Client(
      id: '1',
      cnpj: '00.000.000/0000-00',
      cpf: '000.000.000-00',
      name: 'name-test',
      companyName: 'companyName-test',
      email: 'emial-test',
      dateBirth: 'emial-test',
    );

    expect(client1.hashCode, equals(client2.hashCode));
  });
}
