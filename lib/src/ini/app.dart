import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/home/presentation/pages/home_screen.dart';
import 'package:projeto_sti3/src/modules/order/presentation/pages/order_screen.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/modules/report/presentation/pages/report_screen.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) =>  dependencyAssembly<OrderProvider>(),),
        ChangeNotifierProvider(create:(context) =>  dependencyAssembly<ReportProvider>(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/reports': (context) => const ReportScreen(),
          '/orders': (context) => const OrderScreen(),
        },
      ),
    );
  }
}
