import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_sti3/src/modules/order/data/datasources/order_local_data_source.dart';
import 'package:projeto_sti3/src/modules/order/data/datasources/order_remote_data_source.dart';
import 'package:projeto_sti3/src/modules/order/data/repositories/order_repository_impl.dart';
import 'package:projeto_sti3/src/modules/order/domain/repositories/order_repository.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/gell_all_order_use_case.dart';
import 'package:projeto_sti3/src/modules/order/domain/usecases/sync_order_use_case.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:projeto_sti3/src/shared/domain/http_client.dart';
import 'package:projeto_sti3/src/shared/domain/network_info_impl.dart';
import 'package:projeto_sti3/src/shared/hive/hive_service_impl.dart';
import 'package:projeto_sti3/src/shared/interface/hive_service.dart';
import 'package:projeto_sti3/src/shared/interface/http_adapter.dart';
import 'package:projeto_sti3/src/shared/interface/network_info.dart';

final dependencyAssembly = GetIt.instance;

Future<void> setupDependencyAssembly() async {
  dependencyAssembly
    ..registerLazySingleton<http.Client>(
      http.Client.new,
    )
    
    ..registerLazySingleton<ReportProvider>(
      ReportProvider.new,
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

  _setupModuleOrder();
}

void _setupModuleOrder() {
  dependencyAssembly
    ..registerLazySingleton<OrderProvider>(
      OrderProvider.new,
    )

    ..registerLazySingleton<SyncOrderUseCase>(
      () => SyncOrderUseCase(repository: dependencyAssembly()),
    )

    ..registerLazySingleton<GetAllOrderUseCase>(
      () => GetAllOrderUseCase(repository: dependencyAssembly()),
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
