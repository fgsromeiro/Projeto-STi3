import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class AppTable extends StatelessWidget {
  const AppTable({
    super.key,
    required this.rows,
    required this.columns,
    this.columnWidth,
  });

  final List<String> columns;
  final List<TableRow> rows;
  final Map<int, TableColumnWidth>? columnWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: AppColors.base)),
      child: Table(
        columnWidths: columnWidth,
        children: [
          _tableRowHeader(context, columns.length, columns),
          ...List.generate(
            rows.length,
            (index) {
              return rows[index];
            },
          ),
        ],
      ),
    );
  }

  Widget _tableCell(String value, {bool isHeader = false}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(right: BorderSide(color: AppColors.base))),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  TableRow _tableRowHeader(
    BuildContext context,
    int length,
    List<String> columns,
  ) {
    return TableRow(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.base))),
      children: [
        ...List.generate(
          length - 1,
          (index) {
            return _tableCell(columns[index], isHeader: true);
          },
        ),
        Center(
          child: Text(
            columns.last,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
