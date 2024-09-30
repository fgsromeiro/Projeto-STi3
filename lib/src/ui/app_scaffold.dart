// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const AppScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
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
          widget.title,
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
                  Navigator.pushNamed(context, '/orders');
                },
              ),
              ListTile(
                leading: const Icon(Icons.report),
                title: const Text('Relatórios'),
                onTap: () {
                  Navigator.pushNamed(context, '/reports');
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
          body: widget.child,
        ),
      ),
    );
  }
}
