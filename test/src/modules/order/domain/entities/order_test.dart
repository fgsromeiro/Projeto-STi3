import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';

class MockOrder extends Mock implements Order {}

void main() {
  late final MockOrder mockOrder;
  late final Client client;
  late final Item item;
  late final Payment payment;
  late final Address address;

  setUpAll(
    () {
      mockOrder = MockOrder();
      client = const Client(
        id: '1',
        cnpj: '00.000.000/0000-00',
        cpf: '000.000.000-00',
        name: 'name-test',
        companyName: 'companyName-test',
        email: 'emial-test',
        dateBirth: 'emial-test',
      );
      address = const Address(
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
      item = const Item(
        id: 'id',
        idProduct: 'idProduct-test',
        title: 'title-test',
        quantity: 0,
        unitValue: 0,
      );
      payment = const Payment(
        id: '1',
        code: 'code-test',
        installmentQuantity: 0,
        title: 'title-test',
        value: 0,
      );
    },
  );
  tearDownAll(
    () {
      clearInteractions(mockOrder);
    },
  );

  test('should create a Order instance with the correct values', () {
    final order = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    expect(order.id, equals('id-test'));
    expect(order.numberOrder, equals(0));
    expect(order.creationDate, equals('creationDate-test'));
    expect(order.modificationDate, equals('modificationDate-test'));
    expect(order.status, equals('status-test'));
    expect(order.discount, equals(0));
    expect(order.freight, equals(0));
    expect(order.subTotal, equals(0));
    expect(order.totalValue, equals(0));
    expect(order.client, equals(client));
    expect(order.deliveryAddress, equals(address));
    expect(order.payments, equals([payment]));
    expect(order.itens, equals([item]));
  });

  test('should compare two different Order objects and return false', () {
    final order1 = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    final order2 = Order(
        id: 'id',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    expect(order1 == order2, isFalse);
  });

  test('Should compare two identical Order objects and return true', () {
    final order1 = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    final order2 = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    expect(order1 == order2, isTrue);
  });

  test('hashCode must be consistent with the equality operator', () {
    final order1 = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);
    final order2 = Order(
        id: 'id-test',
        numberOrder: 0,
        creationDate: 'creationDate-test',
        modificationDate: 'modificationDate-test',
        status: 'status-test',
        discount: 0,
        freight: 0,
        subTotal: 0,
        totalValue: 0,
        client: client,
        deliveryAddress: address,
        itens: [item],
        payments: [payment]);

    expect(order1.hashCode, equals(order2.hashCode));
  });
}
