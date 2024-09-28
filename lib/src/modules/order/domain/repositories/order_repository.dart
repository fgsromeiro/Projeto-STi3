import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';

abstract class OrderRepository {
  Future<void> sync();
  Future<List<Order>> getAll();
}
