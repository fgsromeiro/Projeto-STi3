// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';

class SyncOrderUseCase {
  final OrderRepository repository;

  SyncOrderUseCase({
    required this.repository,
  });

  Future<void> call() {
    return repository.sync();
  }
}
