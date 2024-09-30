import 'package:flutter/material.dart';
import 'package:projeto_sti3/src/modules/order/presentation/provider/order_provider.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart.dart';
import 'package:projeto_sti3/src/modules/report/domain/entities/chart_data.dart';
import 'package:projeto_sti3/src/shared/di/dependency_assembly.dart';
import 'package:projeto_sti3/src/utils/styles.dart';

class ReportProvider extends ChangeNotifier {
  final orderProvider = dependencyAssembly<OrderProvider>();

  final _chartTopProducts = Chart(
    title: 'Top Produtos',
    subTitle: 'Produtos mais vendidos',
    chartDatas: [],
  );
  final _chartTopSales = Chart(
    title: 'Top Vendas',
    subTitle: 'Clientes com maior valor em compras',
    chartDatas: [],
  );
  final _chartOrderStatus = Chart(
    title: 'Pedidos',
    subTitle: 'Pedidos aprovados e cancelados',
    chartDatas: [],
  );

  Chart get chartTopProducts => _chartTopProducts;
  Chart get chartTopSales => _chartTopSales;
  Chart get chartOrderStatus => _chartOrderStatus;

  void load() {
    loadChartTopProducts();
    loadChartTopSales();
    loadChartOrderStatus();

    notifyListeners();
  }

  void loadChartTopProducts() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, int> mapProductPerQuantity = {};
    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      for (var item in order.itens) {
        mapProductPerQuantity.update(
          item.title,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartTopProducts.chartDatas.add(
            ChartData(
              productName: key,
              value: value,
              valueReal: 0,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }

  void loadChartTopSales() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, double> mapProductPerQuantity = {};

    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      mapProductPerQuantity.update(
        order.client.name,
        (value) => value + order.totalValue,
        ifAbsent: () => order.totalValue,
      );
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartTopSales.chartDatas.add(
            ChartData(
              productName: key,
              valueReal: value,
              value: 0,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }

  void loadChartOrderStatus() {
    if (orderProvider.listOfOrder.isEmpty) return;

    Map<String, int> mapProductPerQuantity = {};

    var index = 0;

    for (var order in orderProvider.listOfOrder) {
      mapProductPerQuantity.update(
        order.status,
        (value) => value + 1,
        ifAbsent: () => 1,
      );
    }
    var sortedByKey = Map.fromEntries(
      mapProductPerQuantity.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    sortedByKey.forEach(
      (key, value) {
        if (index < 5) {
          _chartOrderStatus.chartDatas.add(
            ChartData(
              productName: key,
              valueReal: 0,
              value: value,
              color: AppColors.chartColors[index],
            ),
          );
        }

        index++;
      },
    );
  }
}
