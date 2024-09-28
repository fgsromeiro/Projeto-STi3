import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/gell_all_order_use_case.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';

class OrderProvider extends ChangeNotifier {
  final syncOrderUseCase = dependencyAssembly<SyncOrderUseCase>();
  final getAllOrderUseCase = dependencyAssembly<GetAllOrderUseCase>();

  bool _isSyncCompleted = false;
  String? _errorMessage;
  List<Order> _listOfOrder = [];

  bool get isRequestCompleted => _isSyncCompleted;
  String? get errorMessage => _errorMessage;
  List<Order> get listOfOrder => _listOfOrder;

  Future<void> sync() async {
    try {
      await syncOrderUseCase.call();

      _isSyncCompleted = true;
      _errorMessage = null;
    } catch (e) {
      _isSyncCompleted = false;
      log(e.toString());
      _errorMessage = 'Erro inesperado: $e';
    }

    notifyListeners();
  }

  Future<void> search(String text) async {
    try {
      if (text.isEmpty) return await getAll();

      var filteredOrders = _listOfOrder
          .where(
            (order) =>
                order.client.name.toUpperCase().contains(text.toUpperCase()),
          )
          .toList();

      _listOfOrder = filteredOrders;

      notifyListeners();
    } catch (e) {}
  }

  Future<void> getAll() async {
    try {
      _listOfOrder = await getAllOrderUseCase.call();
      _listOfOrder.sort(
        (a, b) => a.numberOrder.compareTo(b.numberOrder),
      );
    } catch (e) {
      log(e.toString());
      _errorMessage = 'Erro inesperado: $e';
    }
    notifyListeners();
  }
}
