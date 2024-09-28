// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';

class GetAllOrderUseCase {
  final OrderRepository repository;

  GetAllOrderUseCase({
    required this.repository,
  });

  Future<List<Order>> call() {
    return repository.getAll();
  }
}
