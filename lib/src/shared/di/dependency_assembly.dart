import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_sti3/src/modules/order/data/datasources/order_local_data_source.dart';
import 'package:projeto_sti3/src/modules/order/data/datasources/order_remote_data_source.dart';
import 'package:projeto_sti3/src/modules/order/data/repositories/order_repository_impl.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/shared/domain/http_client.dart';
import 'package:projeto_sti3/src/shared/domain/network_info_impl.dart';
import 'package:projeto_sti3/src/shared/hive/hive_service_impl.dart';
import 'package:projeto_sti3/src/shared/interface/hive_service.dart';
import 'package:projeto_sti3/src/shared/interface/http_adapter.dart';
import 'package:projeto_sti3/src/shared/interface/network_info.dart';

final dependencyAssembly = GetIt.instance;

Future<void> setupDependencyAswsembly() async {
  dependencyAssembly
    ..registerLazySingleton<http.Client>(
      http.Client.new,
    )
    ..registerLazySingleton<NetworkInfo>(
      NetworkInfoImpl.new,
    )
    ..registerLazySingleton<HiveService>(
      () => HiveServiceImpl(),
    )
    ..registerLazySingleton<HttpAdapter>(
      () => HttpClient(
        client: dependencyAssembly(),
      ),
    );

  // _setupHive();
  _setupModuleOrder();
}

void _setupHive() {
  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(PaymentAdapter())
    ..registerAdapter(OrderAdapter())
    ..registerAdapter(ClientAdapter())
    ..registerAdapter(ItemAdapter());
}

void _setupModuleOrder() {
  dependencyAssembly
    ..registerLazySingleton<SyncOrderUseCase>(
      () => SyncOrderUseCase(repository: dependencyAssembly()),
    )

    // Repository
    ..registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(
        localDataSource: dependencyAssembly(),
        remoteDataSource: dependencyAssembly(),
      ),
    )

    // Data Source
    ..registerLazySingleton<OrderLocalDataSource>(
      () => OrderLocalDataSourceImpl(hiveService: dependencyAssembly()),
    )
    ..registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(
        networkInfo: dependencyAssembly(),
        httpAdapter: dependencyAssembly(),
      ),
    );
}
