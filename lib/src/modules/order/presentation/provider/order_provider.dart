import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/gell_all_order_use_case.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';

enum OrderState {
  initial,
  success,
  error,
}

class OrderProvider extends ChangeNotifier {
  final syncOrderUseCase = dependencyAssembly<SyncOrderUseCase>();
  final getAllOrderUseCase = dependencyAssembly<GetAllOrderUseCase>();

  OrderState _state = OrderState.initial;
  bool _wasSynchronized = false;
  String? _message;
  List<Order> _listOfOrder = [];
  Order? _orderSelected;

  OrderState get state => _state;
  Order? get orderSelected => _orderSelected;
  String? get message => _message;
  List<Order> get listOfOrder => _listOfOrder;
  bool get wasSynchronized => _wasSynchronized;

  Future<void> sync() async {
    try {
      await syncOrderUseCase.call();

      _state = OrderState.success;
      _wasSynchronized = true;
      _message = 'Pedidos sincronizados com sucesso!';
    } catch (e) {
      _state = OrderState.error;
      _message = 'Houve um erro inesperado - $e';
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
    } catch (e) {
      _state = OrderState.error;
      _message = 'Houve um erro inesperado - $e';
    }
    reset();
    notifyListeners();
  }

  Future<void> getAll() async {
    try {
      if (!_wasSynchronized) {
        _state = OrderState.success;
        _message = 'Foram encontrados 0 pedidos.';
      } else {
        _listOfOrder = await getAllOrderUseCase.call();
        _listOfOrder.sort(
          (a, b) => a.numberOrder.compareTo(b.numberOrder),
        );
        reset();
      }

      notifyListeners();
    } catch (e) {
      _state = OrderState.error;
      _message = 'Houve um erro inesperado - $e';
    }
  }

  void onSelected(Order order) {
    _orderSelected = order;
    notifyListeners();
  }

  void reset() {
    _state = OrderState.initial;
    _message = null;
  }
}
