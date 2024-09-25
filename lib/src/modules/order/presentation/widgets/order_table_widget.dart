import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class OrderTableWidget extends StatefulWidget {
  const OrderTableWidget({super.key});

  @override
  State<OrderTableWidget> createState() => _OrderTableWidgetState();
}

class _OrderTableWidgetState extends State<OrderTableWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        showCheckboxColumn: false,
        dataRowMaxHeight: 30,
        dataRowMinHeight: 30,
        dataRowColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return const Color.fromARGB(255, 186, 225, 230);
          } else {
            return null;
          }
        }),
        decoration: BoxDecoration(
            border: Border.all(
          color: const Color.fromARGB(255, 177, 177, 177),
        )),
        headingRowHeight: 30,
        columns: [
          _tableColumn('NÚMERO', isBold: true),
          _tableColumn('DATA', isBold: true),
          _tableColumn('CLIENTE', isBold: true),
          _tableColumn('STATUS', isBold: true),
          _tableColumn('VALOR TOTAL', isBold: true),
        ],
        rows: [
          _tableRow(),
          _tableRow(),
        ],
      ),
    );
  }

  DataColumn _tableColumn(String title, {isBold = false}) {
    return DataColumn(
        headingRowAlignment: MainAxisAlignment.center,
        label: Text(
          title,
          style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : null, fontSize: 13),
        ));
  }

  DataRow _tableRow() {
    return DataRow(
      selected: false,
      onSelectChanged: (value) {},
      cells: const [
        DataCell(Center(
            child: Text(
          '00001',
          style: TextStyle(
            fontSize: 13,
          ),
        ))),
        DataCell(
          Center(
              child: Text('Quinta-Feira, 25 Setembro 2020',
                  style: TextStyle(fontSize: 13))),
        ),
        DataCell(
          Center(child: Text('Barry Allen', style: TextStyle(fontSize: 13))),
        ),
        DataCell(
          Center(child: Text('APROVADO', style: TextStyle(fontSize: 13))),
        ),
        DataCell(
          Center(child: Text('R\$ 305,25', style: TextStyle(fontSize: 13))),
        ),
      ],
    );
  }

  Color _getTextColor() {
    // Retorna a cor do texto com base no estado do hover
    if (context.findAncestorStateOfType<_OrderTableWidgetState>()?.mounted ??
        false) {
      return Styles.tertiary; // cor para o texto quando a linha está em hover
    }
    return Colors.black; // cor padrão do texto
  }
}
