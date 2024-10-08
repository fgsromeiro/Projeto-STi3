// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_datetime.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_double.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_integer.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_string.dart';
import 'package:projeto_sti3/src/ui/app_table.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:projeto_sti3/src/utils/utils.dart';
import 'package:provider/provider.dart';

class OrderTableWidget extends StatelessWidget {
  const OrderTableWidget({
    super.key,
    required this.listOfOrders,
  });

  final List<Order> listOfOrders;

  @override
  Widget build(BuildContext context) {
    return AppTable(
      columns: const [
        'NÚMERO',
        'DATA',
        'CLIENTE',
        'STATUS',
        'VALOR TOTAL',
      ],
      rows: [
        ...List.generate(
          listOfOrders.length,
          (index) {
            final order = listOfOrders[index];

            return Utils.tableRowChild(
              context,
              order.numberOrder.toFiveDigits(),
              order.creationDate.toDate().formatDateCapitalize(),
              order.client.name,
              order.status,
              order.totalValue.formatMoney(),
              () => Provider.of<OrderProvider>(listen: false, context)
                  .onSelected(order),
              colorRow: order.status == 'CANCELADO' ? Colors.red : Colors.black,
              () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildModal(context, order),
                );
              },
            );
          },
        )
      ],
      columnWidth: {
        0: FlexColumnWidth(Utils.widthSize(context) * 0.00015),
        1: FlexColumnWidth(Utils.widthSize(context) * 0.0004),
        2: const FlexColumnWidth(),
        3: FlexColumnWidth(Utils.widthSize(context) * 0.00015),
        4: FlexColumnWidth(Utils.widthSize(context) * 0.0002),
      },
    );
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
                  color: AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DETALHES DO PEDIDO',
                        style:
                            TextStyle(fontSize: 13, color: AppColors.tertiary),
                      ),
                      IconButton(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: AppColors.tertiary,
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
                        child: AppTable(
                          columnWidth: {
                            0: FlexColumnWidth(
                                Utils.widthSize(context) * 0.0008),
                            1: FlexColumnWidth(
                                Utils.widthSize(context) * 0.0002),
                            2: FlexColumnWidth(
                              Utils.widthSize(context) * 0.0003,
                            )
                          },
                          rows: [
                            ...List.generate(
                              order.itens.length,
                              (index) {
                                return TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.base))),
                                  children: [
                                    TableRowInkWell(
                                      overlayColor:
                                          WidgetStatePropertyAll<Color>(
                                              AppColors.primary),
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          order.itens[index].title,
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ),
                                    TableRowInkWell(
                                      overlayColor:
                                          WidgetStatePropertyAll<Color>(
                                              AppColors.primary),
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          order.itens[index].quantity
                                              .toString(),
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ),
                                    TableRowInkWell(
                                      overlayColor:
                                          WidgetStatePropertyAll<Color>(
                                              AppColors.primary),
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          order.itens[index].unitValue
                                              .formatMoney(),
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                          columns: const ['PRODUTO', 'QNTD', 'VALOR UNIT.'],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppTable(columnWidth: {
                          0: FlexColumnWidth(Utils.widthSize(context) * 0.0008),
                          1: FlexColumnWidth(Utils.widthSize(context) * 0.0002),
                          2: FlexColumnWidth(
                            Utils.widthSize(context) * 0.0003,
                          )
                        }, rows: [
                          ...List.generate(
                            order.payments.length,
                            (index) {
                              return TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: AppColors.base))),
                                children: [
                                  TableRowInkWell(
                                    overlayColor: WidgetStatePropertyAll<Color>(
                                        AppColors.primary),
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
                                        AppColors.primary),
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
                                        AppColors.primary),
                                    child: Center(
                                      child: Text(
                                        order.payments[index].value
                                            .formatMoney(),
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
