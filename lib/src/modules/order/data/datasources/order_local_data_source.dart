// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/shared/interface/base_exception.dart';
import 'package:projeto_sti3/src/shared/interface/hive_service.dart';
import 'package:projeto_sti3/src/utils/constants.dart';

abstract class OrderLocalDataSource {
  Future<void> insert(List<Order> listOfEntities);
  Future<List<Order>> getAll();
}

class OrderLocalDataSourceImpl implements OrderLocalDataSource {
  final HiveService hiveService;

  OrderLocalDataSourceImpl({
    required this.hiveService,
  });

  @override
  Future<List<Order>> getAll() async {
    try {
      return hiveService.loadAll(Constants.kOrderBox);
    } on BaseException {
      rethrow;
    }
  }

  @override
  Future<void> insert(List<Order> listOfOrders) async {
    try {
      for (var order in listOfOrders) {
        hiveService.insert(order.id, order, Constants.kOrderBox);
      }

      return;
    } on BaseException {
      rethrow;
    }
  }
}
