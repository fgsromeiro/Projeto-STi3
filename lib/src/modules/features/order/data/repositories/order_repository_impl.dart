// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_sti3/src/modules/features/order/data/datasources/order_local_data_source.dart';
import 'package:projeto_sti3/src/modules/features/order/data/datasources/order_remote_data_source.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDataSource localDataSource;
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<void> sync() async {
    final result = await remoteDataSource.getAll();

    await _addLocal(result);

    return;
  }

  Future<void> _addLocal(List<Order> listOfOrders) async {
    await localDataSource.insert(listOfOrders);
  }
}
