import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/presentation/pages/order_screen.dart';
import 'package:projeto_sti3/src/modules/report/presentation/pages/report_screen.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String title = 'INÍCIO';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      title = _titles[index];
    });

    if (_selectedIndex == 2) {
      final reportProvider = dependencyAssembly<ReportProvider>();
      reportProvider.load();
    }
  }

  final List<Widget> _pages = [
    Center(
      child: Opacity(
        opacity: 0.5,
        child: Image.asset(
          'assets/images/logo.png',
        ),
      ),
    ),
    const OrderScreen(),
    const ReportScreen(),
  ];

  final List<String> _titles = [
    'INÍCIO',
    'PEDIDOS',
    'RELATÓRIOS',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.tertiary,
        ),
        title: Text(
          title,
          style: TextStyle(color: AppColors.tertiary),
        ),
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          shape: const BeveledRectangleBorder(),
          surfaceTintColor: AppColors.tertiary,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Pedidos'),
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Relatórios'),
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Scaffold(
          backgroundColor: AppColors.tertiary,
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
      ),
    );
  }
}
