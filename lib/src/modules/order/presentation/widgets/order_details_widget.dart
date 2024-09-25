// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/domain/entities/order.dart';
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
              border: Border.all(color: Styles.primary),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Styles.primary,
            ),
            alignment: Alignment.center,
            height: 30,
            width: double.infinity,
            child: Text(
              'Detalhes do Pedido',
              style: TextStyle(color: Styles.tertiary, fontSize: 13),
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
                            color: Styles.primary,
                          ),
                        ),
                        const Text(
                          'Número: 0010',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Data Criação: 09/02/2021',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Data Alteração: 12/02/2021',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Status: APROVADO',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Desconto: R\$ 40.00',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Frete: R\$ 15.00',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'SubTotal: R\$ 580.00',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Total: R\$ 555.00',
                          style: TextStyle(
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
                            color: Styles.primary,
                          ),
                        ),
                        const Text(
                          'Cliente: Barry Allen',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Documento: 68471698005',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Data Nascimento: 19/02/1996',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'E-mail: theflash@teamflash.com.br',
                          style: TextStyle(
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
                            color: Styles.primary,
                          ),
                        ),
                        const Text(
                          'Endereço: Star Labs',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Número: 01',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'CEP: 00000000',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Bairro: Midtown',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Cidade: Central City',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Estado: KS',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Complemento:',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const Text(
                          'Referência:',
                          style: TextStyle(
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
