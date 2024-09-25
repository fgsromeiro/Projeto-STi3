import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/ui/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'PEDIDOS STI3',
      child: Center(
        child: Opacity(
          opacity: 0.5,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
