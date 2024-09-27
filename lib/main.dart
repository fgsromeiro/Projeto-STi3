import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_sti3/src/ini/app.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   HttpOverrides.global = MyHttpOverrides();

  await setupDependencyAssembly();

  await Hive.initFlutter();

  Hive
    ..initFlutter()
    ..registerAdapter(AddressAdapter())
    ..registerAdapter(PaymentAdapter())
    ..registerAdapter(OrderAdapter())
    ..registerAdapter(ClientAdapter())
    ..registerAdapter(ItemAdapter());

  runApp(const App());
}
