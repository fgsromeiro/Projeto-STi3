import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:projeto_sti3/src/modules/report/presentation/widgets/report_dashboard_widget.dart';
import 'package:projeto_sti3/src/modules/report/presentation/widgets/report_table_widget.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            ReportDashboardWidget(),
            ReportTableWidget(),
          ],
        );
      },
    );
  }
}
