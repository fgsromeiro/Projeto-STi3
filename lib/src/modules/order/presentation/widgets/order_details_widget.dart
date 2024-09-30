// ignore_for_file: public_member_api_docs, sort_ructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_datetime.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_double.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_integer.dart';
import 'package:projeto_sti3/src/shared/extensions/parser_extension_string.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    this.order,
  });

  final Order? order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 177, 177, 177)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: AppColors.primary,
            ),
            alignment: Alignment.center,
            height: 30,
            width: double.infinity,
            child: Text(
              'Detalhes do Pedido',
              style: TextStyle(color: AppColors.tertiary, fontSize: 13),
            ),
          ),
          if (order == null)
            const Expanded(
              child: Center(
                child: Text(
                  'Nenhum pedido selecionado',
                ),
              ),
            )
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Informações do Pedido',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Número: ${order!.numberOrder.toFiveDigits()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Data Criação: ${order!.creationDate.toDate().formatShortDate()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Data Alteração: ${order!.modificationDate.toDate().formatShortDate()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Status: ${order!.status}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Desconto: ${order!.discount.formatMoney()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Frete: ${order!.freight.formatMoney()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'SubTotal: ${order!.freight.formatMoney()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Total: ${order!.freight.formatMoney()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dados do Cliente',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Cliente: ${order!.client.name}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Documento: ${order!.client.cpf}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Data Nascimento: ${order!.client.dateBirth.toDate().formatShortDate()}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'E-mail: ${order!.client.email}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Local de Entrega',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Endereço: ${order!.deliveryAddress.street}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Número: ${order!.deliveryAddress.number}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'CEP: ${order!.deliveryAddress.postCode}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Bairro: ${order!.deliveryAddress.district}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Cidade: ${order!.deliveryAddress.city}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Estado: ${order!.deliveryAddress.state}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Complemento: ${order!.deliveryAddress.complement}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Referência: ${order!.deliveryAddress.reference}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
