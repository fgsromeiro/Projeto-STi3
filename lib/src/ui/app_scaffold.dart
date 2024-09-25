// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const AppScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.secondary,
      appBar: AppBar(
        backgroundColor: Styles.primary,
        title: Text(
          title,
          style: TextStyle(color: Styles.tertiary),
        ),
      ),
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          shape: const BeveledRectangleBorder(),
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
          backgroundColor: Styles.tertiary,
          body: child,
        ),
      ),
    );
  }
}
