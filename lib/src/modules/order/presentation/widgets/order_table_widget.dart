// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/ui/app_table.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:projeto_sti3/src/utils/utils.dart';

class OrderTableWidget extends StatelessWidget {
  const OrderTableWidget({
    super.key,
    required this.listOfOrders,
    required this.onTap,
  });

  final List<Order> listOfOrders;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppTable(columns: const [
      'NÚMERO',
      'DATA',
      'CLIENTE',
      'STATUS',
      'VALOR TOTAL',
    ], rows: [
      ...List.generate(
        listOfOrders.length,
        (index) {
          return Utils.tableRowChild(
            context,
            listOfOrders[index].id,
            listOfOrders[index].creationDate,
            listOfOrders[index].client.name,
            listOfOrders[index].status,
            'R\$ ${listOfOrders[index].totalValue}',
            onTap,
            () {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    _buildModal(context, listOfOrders[index]),
              );
            },
          );
        },
      )
    ]);
  }

  Widget _buildModal(BuildContext context, Order order) {
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
                          ...List.generate(
                            order.itens.length,
                            (index) {
                              return TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Styles.base))),
                                children: [
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        order.itens[index].title,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        order.itens[index].quantity.toString(),
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'R\$ ${order.itens[index].unitValue}',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
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
                          ...List.generate(
                            listOfOrders.length,
                            (index) {
                              return TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Styles.base))),
                                children: [
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        order.payments[index].title,
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    child: Center(
                                      child: Text(
                                        order
                                            .payments[index].installmentQuantity
                                            .toString(),
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        Styles.primary),
                                    child: Center(
                                      child: Text(
                                        'R\$ ${order.payments[index].value}',
                                        style: const TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
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
