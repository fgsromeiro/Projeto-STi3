import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';
import 'package:projeto_sti3/src/utils/constants.dart';

class OrderProvider extends ChangeNotifier {
  final syncOrderUseCase = dependencyAssembly<SyncOrderUseCase>();

  bool _isSyncCompleted = false;
  String? _errorMessage;

  bool get isRequestCompleted => _isSyncCompleted;
  String? get errorMessage => _errorMessage;

  Future<void> sync() async {
    try {
      final request = await Client().get(Uri.parse(Constants.baseUrl),
          headers: {
            "Accept": "application/json",
            "Access-Control_Allow_Origin": "*"
          });

      if (request.statusCode == 200) {
        _isSyncCompleted = true;
        _errorMessage = null; // Sem erro
      } else {
        _isSyncCompleted = true;
        _errorMessage = 'Houve um erro'; // Sem erro
      }

      // await syncOrderUseCase.call();
    } catch (e) {
      _isSyncCompleted = false;
      log(e.toString());
      _errorMessage = 'Erro inesperado: $e';
    }

    notifyListeners();
  }
}
