import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/ui/app_table.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:projeto_sti3/src/utils/utils.dart';

class OrderTableWidget extends StatefulWidget {
  const OrderTableWidget({super.key});

  @override
  State<OrderTableWidget> createState() => _OrderTableWidgetState();
}

class _OrderTableWidgetState extends State<OrderTableWidget> {
  @override
  Widget build(BuildContext context) {
    return AppTable(columns: const [
      'NÚMERO',
      'DATA',
      'CLIENTE',
      'STATUS',
      'VALOR TOTAL',
    ], rows: [
      Utils.tableRowChild(
        context,
        '0001',
        'Quinta-Feira, 30 Março 2024',
        'Barry Allen',
        'APROVADO',
        'R\$ 304,55',
        () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildModal(context),
          );
        },
        () {},
      )
    ]);
  }

  Widget _buildModal(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: SizedBox(
        height: Utils.heightSize(context) * 0.8,
        width: Utils.widthSize(context) * 0.8,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  color: Styles.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DETALHES DO PEDIDO',
                        style: TextStyle(fontSize: 13, color: Styles.tertiary),
                      ),
                      IconButton(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: Styles.tertiary,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppTable(rows: [
                          TableRow(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Styles.base))),
                            children: [
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    'Agasalho SHUIELD',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    'R\$ 295,25',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ], columns: const [
                          'PRODUTO',
                          'QNTD',
                          'VALOR UNIT.'
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppTable(rows: [
                          TableRow(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Styles.base))),
                            children: [
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    'BOLETO',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                child: const Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                              TableRowInkWell(
                                overlayColor: WidgetStatePropertyAll<Color>(
                                    Styles.primary),
                                child: const Center(
                                  child: Text(
                                    'R\$ 295,25',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ], columns: const [
                          'PAGAMENTO',
                          'PARCELA',
                          'VALOR'
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
