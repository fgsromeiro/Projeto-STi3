import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:projeto_sti3/src/modules/features/order/data/models/order_model.dart';
import 'package:projeto_sti3/src/shared/domain/exceptions.dart';
import 'package:projeto_sti3/src/shared/interface/base_exception.dart';
import 'package:projeto_sti3/src/shared/interface/http_adapter.dart';
import 'package:projeto_sti3/src/shared/interface/network_info.dart';
import 'package:projeto_sti3/src/utils/constants.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> getAll();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final HttpAdapter httpAdapter;
  final NetworkInfo networkInfo;
  final Constants constants;

  OrderRemoteDataSourceImpl({
    required this.httpAdapter,
    required this.networkInfo,
    required this.constants,
  });

  @override
  Future<List<OrderModel>> getAll() async {
    try {
      throwIf(
        !await networkInfo.isConnected,
        ConnectionInvalidException('Sem conexão com a internet'),
      );

      final result = await httpAdapter.get(constants.baseUrl);

      if (result.values.isNotEmpty) {
        return List<OrderModel>.from(result as List)
            .map(
              (e) => OrderModel.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      }

      return [];
    } on BaseException {
      rethrow;
    }
  }
}
