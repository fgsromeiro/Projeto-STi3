import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/modules/order/presentation/widgets/order_details_widget.dart';
import 'package:projeto_sti3/src/modules/order/presentation/widgets/order_table_widget.dart';
import 'package:projeto_sti3/src/ui/dialogs.dart';
import 'package:projeto_sti3/src/utils/styles.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, provider, child) {
        if (provider.state == OrderState.success) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Dialogs.showSnackBarMessage(context, message: provider.message!);
          });
        }

        if (provider.state == OrderState.error) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Dialogs.showSnackBarMessage(context, message: provider.message!);
          });
        }

        return Padding(
          padding: const EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onFieldSubmitted: (value) =>
                                    Provider.of<OrderProvider>(context,
                                            listen: false)
                                        .search(
                                  value,
                                ),
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                cursorColor: AppColors.primary,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                cursorHeight: 13,
                                style: const TextStyle(fontSize: 13),
                                controller: controller,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 10,
                                  ),
                                  hintText: 'Pesquise pelo nome do Cliente',
                                  hintStyle: const TextStyle(fontSize: 13),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primary, width: 1),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  errorMaxLines: 2,
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
                                  Provider.of<OrderProvider>(context,
                                          listen: false)
                                      .search(
                                    controller.text,
                                  );
                                },
                                child: Text(
                                  'Pesquisar',
                                  style: TextStyle(
                                      fontSize: 13, color: AppColors.tertiary),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: AppColors.primary),
                                onPressed: () {
                                  Provider.of<OrderProvider>(context,
                                          listen: false)
                                      .sync();
                                },
                                child: Text(
                                  'Sincronizar',
                                  style: TextStyle(
                                      fontSize: 13, color: AppColors.tertiary),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: OrderTableWidget(
                          listOfOrders: provider.listOfOrder,
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: OrderDetailsWidget(
                  order: provider.orderSelected,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
