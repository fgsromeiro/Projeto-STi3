import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projeto_sti3/src/ini/app.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/address.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/client.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/item.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/payment.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyAswsembly();

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
