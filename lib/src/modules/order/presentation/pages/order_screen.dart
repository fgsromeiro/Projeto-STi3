import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/presentation/widgets/order_details_widget.dart';
import 'package:projeto_sti3/src/modules/order/presentation/widgets/order_table_widget.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

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
                            textCapitalization: TextCapitalization.sentences,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            cursorColor: Styles.primary,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: 'Pesquise pelo nome do Cliente',
                              hintStyle: TextStyle(fontSize: 13),
                              filled: true,
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                                // borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                backgroundColor: Styles.primary),
                            onPressed: () {},
                            child: Text(
                              'Pesquisar',
                              style: TextStyle(
                                  fontSize: 13, color: Styles.tertiary),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Styles.primary),
                            onPressed: () {},
                            child: Text(
                              'Sincronizar',
                              style: TextStyle(
                                  fontSize: 13, color: Styles.tertiary),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: OrderTableWidget(
                      listOfOrders: const [],
                      onTap: () {},
                    ),
                  )
                ],
              )),
          const SizedBox(
            width: 10,
          ),
          const Expanded(flex: 2, child: OrderDetailsWidget())
        ],
      ),
    );
  }
}
