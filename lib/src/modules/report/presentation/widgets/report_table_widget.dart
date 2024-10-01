import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/age_group_sales_totals.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/city_sales_totals.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/payment_totals_per_day.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/top_selling_product.dart';
import 'package:projeto_sti3/src/modules/report/presentation/provider/report_provider.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_datetime.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_double.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_string.dart';
import 'package:projeto_sti3/src/ui/app_table.dart';
import 'package:projeto_sti3/src/utils/dialogs.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:provider/provider.dart';

class ReportTableWidget extends StatefulWidget {
  const ReportTableWidget({super.key});

  @override
  State<ReportTableWidget> createState() => _ReportTableWidgetState();
}

class _ReportTableWidgetState extends State<ReportTableWidget> {
  List<String> titleReport = [
    'Listagem de Produtos mais Vendidos',
    'Totalização de Formas de Pagamento',
    'Totalização de Vendas por Cidade',
    'Totalização de Vendas por Faixa Etária'
  ];

  int? selectTable;
  String? valueSelect;

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(
      builder: (context, provider, child) {
        return Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: DropdownButton<String>(
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                        focusColor: Colors.transparent,
                        underline: const SizedBox.shrink(),
                        hint: const Text("Selecione o tipo relatório"),
                        value: valueSelect,
                        items: titleReport.map((String report) {
                          return DropdownMenuItem<String>(
                            value: report,
                            child: Text(report),
                          );
                        }).toList(),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            valueSelect = value;
                            selectTable = titleReport.indexOf(value ?? '');
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        Dialogs.showSnackBarMessage(context,
                            message: 'Exportado com sucesso (Teste)');
                      },
                      child: Text(
                        'Exportar',
                        style:
                            TextStyle(fontSize: 13, color: AppColors.tertiary),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _buildTableSelected(selectTable, provider) ??
                  const SizedBox.shrink(),
            )
          ],
        ));
      },
    );
  }

  Widget? _buildTableSelected(int? index, ReportProvider provider) {
    switch (index) {
      case 0:
        return _buildTableTopSelling(context, provider.topSellingProducts);
      case 1:
        return _buildTablePaymentTotalsPerDay(
            context, provider.paymentTotalsPerDays);
      case 2:
        return _buildTableCitySalesTotals(context, provider.citySalesTotals);
      case 3:
        return _buildTableAgeGroupSalesTotals(
            context, provider.ageGroupSalesTotals);

      default:
        return null;
    }
  }

  Widget _buildTableTopSelling(
    BuildContext context,
    List<TopSellingProduct> listTopSellingProduct,
  ) {
    return AppTable(
      columns: const [
        'PRODUTO',
        'QUANTIDADE',
        'VALOR MÉDIO',
      ],
      rows: [
        ...List.generate(
          listTopSellingProduct.length,
          (index) {
            final order = listTopSellingProduct[index];

            return TableRow(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.base))),
              children: [
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      order.nameProduct,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.quantity.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.averageValue.formatMoney(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
      columnWidth: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
    );
  }

  Widget _buildTablePaymentTotalsPerDay(
    BuildContext context,
    List<PaymentTotalsPerDay> listPaymentTotalsPerDay,
  ) {
    return AppTable(
      columns: const [
        'DATA',
        'FORMA',
        'VALOR',
      ],
      rows: [
        ...List.generate(
          listPaymentTotalsPerDay.length,
          (index) {
            final order = listPaymentTotalsPerDay[index];

            return TableRow(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.base))),
              children: [
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      order.orderDate.toDate().formatDateCapitalize(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.paymentMethod,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.value.formatMoney(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
      columnWidth: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
    );
  }

  Widget _buildTableCitySalesTotals(
    BuildContext context,
    List<CitySalesTotals> listCitySalesTotals,
  ) {
    return AppTable(
      columns: const [
        'CIDADE',
        'QUANTIDADE',
        'VALOR',
      ],
      rows: [
        ...List.generate(
          listCitySalesTotals.length,
          (index) {
            final order = listCitySalesTotals[index];

            return TableRow(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.base))),
              children: [
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      order.city,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.quantityOrders.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.totalValue.formatMoney(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
      columnWidth: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
    );
  }

  Widget _buildTableAgeGroupSalesTotals(
    BuildContext context,
    List<AgeGroupSalesTotals> listAgeGroupSalesTotals,
  ) {
    return AppTable(
      columns: const [
        'FAIXA ETÁRIA',
        'QUANTIDADE',
        'VALOR',
      ],
      rows: [
        ...List.generate(
          listAgeGroupSalesTotals.length,
          (index) {
            final order = listAgeGroupSalesTotals[index];

            return TableRow(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.base))),
              children: [
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      order.ageRange,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.quantityOrders.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                TableRowInkWell(
                  overlayColor:
                      WidgetStatePropertyAll<Color>(AppColors.primary),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      order.totalValue.formatMoney(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                )
              ],
            );
          },
        )
      ],
      columnWidth: const {
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
    );
  }
}
