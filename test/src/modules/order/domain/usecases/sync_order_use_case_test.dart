import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/shared/domain/exceptions.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late SyncOrderUseCase useCase;
  late MockOrderRepository mockRepository;

  setUpAll(() {
    mockRepository = MockOrderRepository();
    useCase = SyncOrderUseCase(repository: mockRepository);
  });

  tearDownAll(
    () {
      clearInteractions(mockRepository);
    },
  );

  test('should call sync method on repository', () async {
    when(() => mockRepository.sync()).thenAnswer(
      (invocation) => Future.value(),
    );

    await useCase.call();

    verify(() => mockRepository.sync()).called(1);
  });

  test('should throw a ServerErrorException exception when getAll fails',
      () async {
    when(() => mockRepository.sync()).thenThrow(ServerErrorException(''));

    expect(() => useCase.call(), throwsA(isA<Exception>()));

    verify(() => mockRepository.sync()).called(1);
  });

  test('should throw a ConnectionInvalidException exception when getAll fails',
      () async {
    when(() => mockRepository.sync()).thenThrow(ConnectionInvalidException(''));

    expect(() => useCase.call(), throwsA(isA<Exception>()));

    verify(() => mockRepository.sync()).called(1);
  });
  test('should throw a LocalDatabaseException exception when getAll fails',
      () async {
    when(() => mockRepository.sync()).thenThrow(LocalDatabaseException(''));

    expect(() => useCase.call(), throwsA(isA<Exception>()));

    verify(() => mockRepository.sync()).called(1);
  });
}
