import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';

void main() {
  group('Address', () {
    // Teste básico para verificar a criação de uma instância
    test('should create an instance with given values', () {
      const address = Address(
        id: '1',
        street: 'Main Street',
        number: '123',
        postCode: '12345-678',
        district: 'Central',
        city: 'Metropolis',
        state: 'NY',
        complement: 'Apt 4B',
        reference: 'Near Central Park',
      );

      expect(address.id, '1');
      expect(address.street, 'Main Street');
      expect(address.number, '123');
      expect(address.postCode, '12345-678');
      expect(address.district, 'Central');
      expect(address.city, 'Metropolis');
      expect(address.state, 'NY');
      expect(address.complement, 'Apt 4B');
      expect(address.reference, 'Near Central Park');
    });

    // Teste de igualdade (Equatable)
    test('should consider two Address instances equal if they have the same properties', () {
      const address1 = Address(
        id: '1',
        street: 'Main Street',
        number: '123',
        postCode: '12345-678',
        district: 'Central',
        city: 'Metropolis',
        state: 'NY',
        complement: 'Apt 4B',
        reference: 'Near Central Park',
      );

      const address2 = Address(
        id: '1',
        street: 'Main Street',
        number: '123',
        postCode: '12345-678',
        district: 'Central',
        city: 'Metropolis',
        state: 'NY',
        complement: 'Apt 4B',
        reference: 'Near Central Park',
      );

      expect(address1, address2);
    });

    // Teste de imutabilidade
    test('should be immutable', () {
      const address = Address(
        id: '1',
        street: 'Main Street',
        number: '123',
        postCode: '12345-678',
        district: 'Central',
        city: 'Metropolis',
        state: 'NY',
        complement: 'Apt 4B',
        reference: 'Near Central Park',
      );

      // Tentar alterar uma propriedade causará erro de compilação, garantindo a imutabilidade
      // address.id = '2'; // Isso resultaria em erro
      expect(() => address.props, returnsNormally);
    });

    // Teste de serialização (caso seja relevante)
    // test('should serialize to JSON correctly', () {
    //   const address = Address(
    //     id: '1',
    //     street: 'Main Street',
    //     number: '123',
    //     postCode: '12345-678',
    //     district: 'Central',
    //     city: 'Metropolis',
    //     state: 'NY',
    //     complement: 'Apt 4B',
    //     reference: 'Near Central Park',
    //   );
    //
    //   final json = address.toJson(); // Precisa implementar o método toJson()
    //
    //   expect(json, {
    //     'id': '1',
    //     'street': 'Main Street',
    //     'number': '123',
    //     'postCode': '12345-678',
    //     'district': 'Central',
    //     'city': 'Metropolis',
    //     'state': 'NY',
    //     'complement': 'Apt 4B',
    //     'reference': 'Near Central Park',
    //   });
    // });
  });
}
