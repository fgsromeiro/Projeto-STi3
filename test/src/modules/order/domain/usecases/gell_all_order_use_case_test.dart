import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/gell_all_order_use_case.dart';
import 'package:projeto_sti3/src/shared/domain/exceptions.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

class MockOrder extends Mock implements Order {}

void main() {
  late final GetAllOrderUseCase useCase;
  late final MockOrderRepository mockRepository;
  late final List<MockOrder> listOfMockOrder;

  setUpAll(() {
    mockRepository = MockOrderRepository();
    useCase = GetAllOrderUseCase(repository: mockRepository);
    listOfMockOrder = [MockOrder()];
  });

  tearDownAll(
    () {
      clearInteractions(mockRepository);
    },
  );

  test('should return a list of orders when getAll is called', () async {
    when(() => mockRepository.getAll())
        .thenAnswer((_) async => listOfMockOrder);

    final result = await useCase.call();

    expect(result, equals(listOfMockOrder));
    verify(() => mockRepository.getAll()).called(1);
  });

  test('Should throw a LocalDatabaseException exception when getAll fails',
      () async {
    when(() => mockRepository.getAll()).thenThrow(LocalDatabaseException(''));

    expect(() => useCase.call(), throwsA(isA<Exception>()));
    verify(() => mockRepository.getAll()).called(1);
  });
  test('Should throw a ConnectionInvalidException exception when getAll fails',
      () async {
    when(() => mockRepository.getAll())
        .thenThrow(ConnectionInvalidException(''));

    expect(() => useCase.call(), throwsA(isA<Exception>()));
    verify(() => mockRepository.getAll()).called(1);
  });
}
